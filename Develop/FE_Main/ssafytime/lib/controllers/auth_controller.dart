import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ssafytime/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/services/auth_service.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  Rx<User?> user = Rx<User?>(null);

  final storage = const FlutterSecureStorage();

  @override
  void onInit() async {
    // await fetchUser(AuthService.to.token);
    log("${user.value}");
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> fetchUser(String? token) async {
    if (token != null) {
      var response = await http.get(
          Uri.parse("http://i8a602.p.ssafy.io:9090/user/my-page"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}"
          });
      if (response.statusCode == 200) {
        user.value = User.fromRawJson(response.body);
        String? fcmToken = await FirebaseMessaging.instance.getToken(
            vapidKey:
                "BKEyfl55H2kgfEnSwt3yqPp9CwLtf9Ntgwv13RiT-U-jjzrozda7WadN2v6Z4Cl6x4_dOxHLMdeh3rfKjiL2YTM");
        updateFCMToken(fcmToken, AuthService.to.token);
      }
    }
  }

  void updateFCMToken(String? fcmToken, String? token) async {
    var response = await http.post(
        Uri.parse("http://i8a602.p.ssafy.io:9090/user/alarm"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token}"
        },
        body: json.encode({"fcmtoken": fcmToken}));
    log("fcm Regist : ${response.statusCode}");
  }
}
