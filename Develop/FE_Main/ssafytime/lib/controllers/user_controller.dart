import 'dart:developer';

import 'package:get/get.dart';
import 'package:ssafytime/models/user_model.dart';
import 'package:ssafytime/repositories/user_repository.dart';
import 'package:ssafytime/services/auth_service.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  Rx<User?> user = Rx<User?>(null);

  UserRepo userApi = UserRepo(token: AuthService.to.token ?? "");

  @override
  void onInit() async {
    await fetchUser();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> fetchUser() async {
    user.value = await userApi.fetchUserInfo();
    log("${user.value?.userEmail}");
    if (user.value != null) {
      var fcmToken = await userApi.fetchFcmToken();
      bool res = await userApi.updateFcmToken(fcmToken);
      if (res) {
        log("Login : Success / FcmToken : Success");
      } else {
        log("Login : Success / FcmToken : Failed");
      }
    } else {
      log("Login : Failed / FcmToken : Failed");
    }
  }
}
