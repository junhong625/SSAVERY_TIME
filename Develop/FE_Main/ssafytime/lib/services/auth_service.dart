import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ssafytime/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final user = User().obs;
  final storage = const FlutterSecureStorage();
  final tokenState = 0.obs;
  final autoLogin = false.obs;
  bool isLogin = false;

  String _accessKey = "accessToken";
  String _refreshKey = "refreshToken";
  RxString accessToken = "".obs;
  RxString refreshToken = "".obs;
  @override
  void onInit() async {
    log("accessToken : $accessToken");
    log("refreshToken : $refreshToken");
    log("isLogin : $isLogin");
    super.onInit();
  }

  Future<void> getToken() async {
    accessToken.value = await storage.read(key: _accessKey) ?? "";
    refreshToken.value = await storage.read(key: _refreshKey) ?? "";
    if (accessToken.value != "" && refreshToken.value != "") {
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
      log("login : ${res.statusCode}");
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        accessToken.value = data['accessToken'];
        refreshToken.value = data['refreshToken'];
        if (autoLoginFlag ?? false) {
          await storage.write(key: _accessKey, value: accessToken.value);
          await storage.write(key: _refreshKey, value: refreshToken.value);
        }
        autoLogin(autoLoginFlag ?? false);
        log("login : access => ${accessToken.value} / refresh => ${refreshToken.value}");
        isLogin = true;
        tokenState.value = res.statusCode;
        Get.offAllNamed('/');
      } else if (res.statusCode == 401) {
        tokenState.value = res.statusCode;
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
    clearToken();
    accessToken.value = "";
    refreshToken.value = "";
    user(null);
    isLogin = false;

    Get.offAllNamed('/login');
  }

  void clearToken() async {
    await storage.delete(key: _accessKey);
    await storage.delete(key: _refreshKey);
  }

//   Future<void> checkTokenState() async {
//     var res = await http.post(
//         Uri.parse("http://i8a602.p.ssafy.io/refresh-token"),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode({
//           "accessToken": accessToken.value,
//           "refreshToken": refreshToken.value
//         }));
//     if (res.statusCode == 200) {
//       var data = json.decode(res.body);
//       accessToken.value = data['accessToken'];
//       refreshToken.value = data['refreshToken'];
//       if (autoLogin.value) {
//         await storage.write(key: _accessKey, value: accessToken.value);
//         await storage.write(key: _refreshKey, value: refreshToken.value);
//       }
//       tokenState.value = res.statusCode;
//     }
//   }
}
