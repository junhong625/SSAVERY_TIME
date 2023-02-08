import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ssafytime/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final Rx<User?> user = Rx<User?>(null);
  final storage = const FlutterSecureStorage();
  bool isLogin = false;

  String? token = null;
  @override
  void onInit() async {
    await getToken();
    log("token : $token");
    log("isLogin : $isLogin");
    super.onInit();
  }

  Future<void> getToken() async {
    token = await storage.read(key: "token");
    if (token != null) {
      isLogin = true;
    }
  }

  Future<void> login(String email, String password, bool? autoLoginFlag) async {
    try {
      var res = await http.post(
        Uri.parse("http://i8a602.p.ssafy.io:9090/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"userEmail": email, "password": password}),
        encoding: Encoding.getByName("utf-8"),
      );
      log("${res.statusCode}");
      if (res.statusCode == 200) {
        token = json.decode(res.body)['token'];
        if (autoLoginFlag ?? false) {
          await storage.write(key: "token", value: token);
        }
        log("$token");
        isLogin = true;
        Get.offAllNamed('/');
      }
    } catch (e) {
      Get.snackbar("오류", "정보",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("로그인 실패"),
          messageText: Text(e.toString()));
    }
  }

  void logout() async {
    await storage.delete(key: "token");
    token = null;
    user.value = null;
    isLogin = false;
    Get.offAllNamed('/login');
  }
}
