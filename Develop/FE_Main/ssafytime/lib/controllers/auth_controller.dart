import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ssafytime/models/auth_info.dart';
import 'package:ssafytime/models/user_model.dart';
import 'package:ssafytime/screens/login_screen.dart';
import 'package:ssafytime/screens/root_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<AuthInfo?> authInfo;
  Rx<User?> user = Rx<User?>(null);
  Rx<String?> token = Rx<String?>(null);
  RxBool autoLoginFlag = false.obs;

  final storage = const FlutterSecureStorage();

  late final SharedPreferences pref;

  @override
  void onInit() async {
    pref = await SharedPreferences.getInstance();
    autoLoginFlag.value = pref.getBool("autoLoginFlag") ?? false;
    log("${autoLoginFlag.value}");
    ever(user, _moveToPage);
    super.onInit();
  }

  @override
  void onReady() async {
    await autoLoginCheck();
    super.onReady();
  }

  Future<void> autoLoginCheck() async {
    if (autoLoginFlag.value) {
      token.value = await storage.read(key: "Token");
      await fetchUser();
    }
  }

  Future<void> fetchUser() async {
    if (token.value != null) {
      var response = await http.get(
          Uri.parse("http://i8a602.p.ssafy.io:9090/user/my-page"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token.value}"
          });
      if (response.statusCode == 200) {
        user.value = User.fromRawJson(response.body);
        var fcmToken = await FirebaseMessaging.instance.getToken(
            vapidKey:
                "BKEyfl55H2kgfEnSwt3yqPp9CwLtf9Ntgwv13RiT-U-jjzrozda7WadN2v6Z4Cl6x4_dOxHLMdeh3rfKjiL2YTM");
        updateFCMToken(fcmToken);
      }
    }
  }

  void updateFCMToken(fcmToken) async {
    var response = await http.post(
        Uri.parse("http://i8a602.p.ssafy.io:9090/user/alarm"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token}"
        },
        body: json.encode({"fcmtoken": fcmToken}));
    log("fcm Regist : ${response.statusCode}");
  }

  _moveToPage(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => RootScreen());
    }
  }

  void login(String email, String password) async {
    try {
      var response = await http.post(
          Uri.parse("http://i8a602.p.ssafy.io:9090/login"),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"userEmail": email, "password": password}),
          encoding: Encoding.getByName("utf-8"));
      log("${json.decode(response.body)['token']}");
      if (response.statusCode == 200) {
        token.value = json.decode(response.body)['token'];
        if (autoLoginFlag.value) {
          await pref.setBool("autoLoginFlag", autoLoginFlag.value);
          await storage.write(key: "Token", value: token.value);
        }
      }
      await fetchUser();
    } catch (e) {
      Get.snackbar(
        "Error Message",
        "User message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Login Faild"),
        messageText: Text(e.toString()),
      );
    }
  }

  void logout() async {
    await storage.deleteAll();
    await pref.remove("autoLoginFlag");
    user.value = null;
  }

  Widget defaultScreen() {
    if (token.value == null) {
      return LoginScreen();
    } else {
      return RootScreen();
    }
  }
}
