import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ssafytime/services/auth_service.dart';

class AuthGuard extends GetMiddleware {
//   String? token = await AuthService.to.storage.read(key: "token");
  @override
  RouteSettings? redirect(String? route) {
    if (!AuthService.to.isLogin) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
