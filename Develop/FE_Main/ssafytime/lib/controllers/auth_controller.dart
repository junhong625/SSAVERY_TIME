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
  FirebaseMessaging fcm = FirebaseMessaging.instance;

  late Rx<AuthInfo?> authInfo;
  Rx<User?> user = Rx<User?>(null);

  final storage = const FlutterSecureStorage();

  late final SharedPreferences pref;

  @override
  void onReady() async {
    super.onReady();
    pref = await SharedPreferences.getInstance();
    bool isAutoLogin = pref.getBool("autoLoginCheck") ?? false;
    await autoLoginCheck(isAutoLogin);
    ever(user, _moveToPage);
  }

  Future<void> autoLoginCheck(bool isAutoLogin) async {
    if (isAutoLogin) {
      String? Token = await storage.read(key: "Token");
      await fetchUser(Token);
    }
  }

  Future<void> fetchUser(String? Token) async {
    if (Token != null) {
      var response = await http.get(
          Uri.parse("http://i8a602.p.ssafy.io:9090/user/my-page"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${Token}"
          });
      log("${json.decode(response.body)}");
      if (response.statusCode == 200) {
        user.value = User.fromRawJson(response.body);
        var fcmToken = fcm.getToken(
            vapidKey:
                "BKEyfl55H2kgfEnSwt3yqPp9CwLtf9Ntgwv13RiT-U-jjzrozda7WadN2v6Z4Cl6x4_dOxHLMdeh3rfKjiL2YTM");
      }
    }
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
      await fetchUser(json.decode(response.body)['token']);
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

  void logout() {
    user.value = null;
  }
}
