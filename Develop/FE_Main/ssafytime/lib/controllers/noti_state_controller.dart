import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/models/noti_custom_state.dart';
import 'package:ssafytime/models/noti_default_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// 알림 설정 관련 Controller
// 생성 인자값 : userIdx 유저 번호
// defaultState { 기본 알림 설정
//      surveyNoti : 설문조사 알림 on/off
//      announceNoti : 공지사항 알림 on/off
//      counselNoti : 상담 알림 on/off
// }
// customState { 개인 알림 설정
//      title : 알림 제목
//      repeatDate : 반복 날짜
//      time : 알림 시간
//      isOn : 알림 on/off
// }

class NotiStateController extends GetxController {
  late SharedPreferences pref;
  late NotiDefaultState defaultState;
  RxList<Widget> displayDefaultState = <Widget>[].obs;
  RxList<NotiCustomState> customState = <NotiCustomState>[].obs;
  RxList<Widget> displayCustomState = <Widget>[].obs;

  Rxn<DateTime> dateTime = Rxn<DateTime>(DateTime.now());
  RxList<String> dateSelected = <String>[].obs;
  final int? userIdx;

  NotiStateController({this.userIdx});

  @override
  void onInit() async {
    super.onInit();
    pref = await SharedPreferences.getInstance();
    fetchCustomState();
    dateTime.value = DateTime.now();
  }

  @override
  void onClose() async {
    // fetchDefaultState();
    await pref.setStringList(
      "${userIdx}_noti",
      List<String>.from(
        customState.map(
          (e) => jsonEncode(e.toJson()),
        ),
      ),
    );
  }

// 내부 저장소에서 개인 알림 가져오기
  void fetchCustomState() async {
    final List<String>? customStateItems =
        pref.getStringList("${userIdx}_noti");
    if (customStateItems != null) {
      var item = List<NotiCustomState>.from(
          customStateItems.map((e) => NotiCustomState.fromRawJson(e)));
      customState.addAll(item);
      _setDisplayCustomState();
    }
  }

// 개인 알림 삭제
  void removeCustomState(int index) {
    customState.removeAt(index);
    displayCustomState.removeAt(index);
  }

// 개인 알림 위젯 설정
  void _setDisplayCustomState() {
    var item = List<Widget>.from(
      customState.map(
        (e) => Column(
          children: [
            SwitchListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              contentPadding: EdgeInsets.fromLTRB(32, 0, 16, 0),
              title: Text(e.title),
              value: e.isOn,
              onChanged: (bool value) {
                e.isOn = value;
              },
            ),
            Divider()
          ],
        ),
      ),
    );
    displayCustomState.addAll(item);
  }

// 개인 알림 추가
  void addCustomState(String title) {
    bool state = true;
    NotiCustomState custom = NotiCustomState(
        title: title,
        repeatDate: dateSelected,
        time: dateTime.value ?? DateTime.now(),
        isOn: state);
    customState.add(custom);
  }

// 서버에서 기본 알림 설정 가져오기
  void fetchDefaultState() async {
    var response = await http.get(Uri.parse(""));
    if (response.statusCode == 200) {
      defaultState = NotiDefaultState.fromRawJson(response.body);
      _setDisplayDefaultState();
    }
  }

// 기본 알림 위젯 설정
  void _setDisplayDefaultState() {
    displayDefaultState.addAll([
      Column(
        children: [
          SwitchListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.fromLTRB(32, 0, 16, 0),
            title: Text("설문조사 알림"),
            value: defaultState.surveyNoti,
            onChanged: (bool value) {
              defaultState.surveyNoti = value;
            },
          ),
          Divider(),
        ],
      ),
      Column(
        children: [
          SwitchListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.fromLTRB(32, 0, 16, 0),
            title: Text("공지사항 알림"),
            value: defaultState.announceNoti,
            onChanged: (bool value) {
              defaultState.announceNoti = value;
            },
          ),
          Divider(),
        ],
      ),
      Column(
        children: [
          SwitchListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.fromLTRB(32, 0, 16, 0),
            title: Text("상담 알림"),
            value: defaultState.counselNoti,
            onChanged: (bool value) {
              defaultState.counselNoti = value;
            },
          ),
          Divider(),
        ],
      )
    ]);
  }
}
