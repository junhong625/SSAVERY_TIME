import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:saffytime/models/auth_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<AuthInfo?> authInfo;

  final storage = const FlutterSecureStorage();

  late final SharedPreferences pref;

  @override
  void onReady() async {
    super.onReady();
    pref = await SharedPreferences.getInstance();
    bool autoLoginCheck = pref.getBool("autoLoginCheck") ?? false;
    if (autoLoginCheck) {
      String? accessToken = await storage.read(key: "accessToken");
      String? refreshToken = await storage.read(key: "refreshToken");
    }
  }

  _moveToPage(AuthInfo authInfo) {
    if (authInfo == null) {}
  }
}
