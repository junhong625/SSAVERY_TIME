import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ssafytime/services/auth_service.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!AuthService.to.isLogin) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }

//   @override
//   Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//     if (!AuthService.to.isLogin) {
//       return GetNavConfig.fromRoute("/login");
//     } else {
//       return super.redirectDelegate(route);
//     }
//   }
}
