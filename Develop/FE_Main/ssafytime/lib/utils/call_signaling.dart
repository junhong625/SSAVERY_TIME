import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:http/http.dart' as http;

enum SignalingState {
  CallStateNew,
  CallStateRinging,
  CallStateInvite,
  CallStateConnected,
  CallStateBye,
  ConnectionOpen,
  ConnectionClosed,
  ConnectionError,
  CallStateWaiting
}

class JsonConstants {
  static const String value = 'value';
  static const String params = 'params';
  static const String method = 'method';
  static const String id = 'id';
  static const String result = 'result';
  static const String iceCandidate = 'iceCandidate';
  static const String participantJoined = "participantJoined";
  static const String participantEvicted = "participantEvicted";
  static const String participantUnpublished = "participantUnpublished";
  static const String streamPropertyChanged = "streamPropertyChanged";
  static const String sendMessage = "sendMessage";
  static const String participantPublished = "participantPublished";
  static const String participantLeft = "participantLeft";
  static const String sessionId = "sessionId";
  static const String sdpAnswer = "sdpAnswer";
  static const String joinRoom = "joinRoom";
  static const String metadata = "metadata";
  static const String publishVideo = "publishVideo";
  static const String onIceCandidate = 'onIceCandidate';
  static const String receiveVideoFrom = 'receiveVideoFrom';
  static const String endpointName = 'endpointName';
  static const String senderConnectionId = 'senderConnectionId';
  static const String connectionId = 'connectionId';
  static const String leaveRoom = 'leaveRoom';
  static const String streams = 'streams';
}

typedef void StreamStateCallback(MediaStream stream);

class CallSignaling {
  CallSignaling(
      {required this.url,
      required this.secret,
      required this.sessionId,
      required this.userName,
      required this.onLocalStream,
      required this.onAddRemoteStream,
      required this.onRemoveRemoteStream});

  final String url;
  final String secret;
  final String sessionId;
  final String userName;
  late final WebSocket socket;
  MediaStream? _localStream;
  RTCPeerConnection? _localPeerConnection;

  int _internalId = 1;

  StreamStateCallback onLocalStream;
  StreamStateCallback onAddRemoteStream;
  StreamStateCallback onRemoveRemoteStream;

  bool _haveRemoteAlreadyInRoom = false;

  final _iceServers = {
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'}
    ]
  };
  final _contraints = {
    'mandatory': {
      'OfferToReceiveAudio': true,
      'OfferToReceiveVideo': true,
    },
    'optional': [],
  };

  Future<String?> createWebRtcToken() async {
    var body = {
      "type": "WEBRTC",
      "data": "",
      "record": false,
      "role": "PUBLISHER",
      "kurentoOptions": {
        "videoMaxRecvBandwidth": 1000,
        "videoMinRecvBandwidth": 300,
        "videoMaxSendBandwidth": 1000,
        "videoMinSendBandwidth": 300,
        "allowedFilters": ["GStreamerFilter", "ZBarFilter"]
      }
    };
    var header = {
      "Authorization":
          "Basic ${base64Encode(utf8.encode("OPENVIDUAPP:$secret"))}",
      "Content-Type": "application/json"
    };

    var res = await http.post(
        Uri.parse(
            "https://${url}/openvidu/api/sessions/${sessionId}/connection"),
        body: body,
        headers: header);

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      return data['id'];
    }
    return null;
  }

  Future<void> connect(String token) async {
    try {
      socket = await WebSocket.connect("ws://${url}/openvidu");

      _createLocalPeerConnection().then((_) {
        _sendJson(JsonConstants.joinRoom, {
          JsonConstants.metadata: '{\"clientData\": \"$userName\"}',
          'secret': '',
          'platform': Platform.isAndroid ? 'Android' : 'iOS',
          // 'dataChannels': 'false',
          'session': sessionId,
          'token': token,
        });
        _createLocalOffer();
      });
    } catch (e) {
      log("connecting ERROR : ${e}");
    }
  }

  Future<void> _createLocalPeerConnection() async {
    _localStream = await createStream(isLocalStream: true);
    _localPeerConnection = await createPeerConnection(_iceServers, _contraints);

    _localPeerConnection!.onIceCandidate = (candidate) {
      var iceCandidateParams = {
        'sdpMid': candidate.sdpMid,
        'sdpMLineIndex': candidate.sdpMLineIndex,
        'candidate': candidate.candidate,
      };
    };
    _localPeerConnection!.addStream(_localStream!);
  }

  Future<MediaStream> createStream({isLocalStream = false}) async {
    final mediaConstraints = {
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth': '320',
          'minHeight': '240',
          'minFrameRate': '30',
        },
        'facingMode': 'user',
        'optional': [],
      }
    };
    MediaStream stream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);
    if (isLocalStream) {
      this.onLocalStream(stream);
    }
    return stream;
  }

  Future<void> _createLocalOffer() async {
    try {
      RTCSessionDescription _localOffer =
          await _localPeerConnection!.createOffer(_contraints);
      await _localPeerConnection!.setLocalDescription(_localOffer);
      _sendJson(JsonConstants.publishVideo, {
        'audioOnly': 'false',
        'hasAudio': 'true',
        'doLoopback': 'false',
        'hasVideo': 'true',
        'audioActive': 'true',
        'videoActive': 'true',
        'typeOfVideo': 'CAMERA',
        'frameRate': '30',
        'videoDimensions': '{\"width\": 320, \"height\": 240}',
        'sdpOffer': _localOffer.sdp
      });
    } catch (e) {
      log("Local Offer ERROR : ${e}");
    }
  }

  void updateInternalId() {
    _internalId++;
  }

  void _sendJson(String methods, Map<String, dynamic>? params) {
    Map<String, dynamic> dict = <String, dynamic>{};
    dict[JsonConstants.method] = methods;
    dict[JsonConstants.id] = _internalId;
    dict['jsonrpc'] = '2.0';
    if ((params?.length ?? 0) > 0) {
      dict[JsonConstants.params] = params;
    }
    updateInternalId();
    String jsonString = json.encode(dict);
    socket.add(jsonString);
  }
}
