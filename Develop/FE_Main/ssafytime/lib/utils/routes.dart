import 'package:get/get.dart';
import 'package:ssafytime/controllers/user_controller.dart';
import 'package:ssafytime/screens/counsel_screen.dart';
import 'package:ssafytime/screens/login_screen.dart';
import 'package:ssafytime/screens/notification_screen.dart';
import 'package:ssafytime/screens/root_screen.dart';
import 'package:ssafytime/screens/user_screen.dart';
import 'package:ssafytime/test_page.dart';
import 'package:ssafytime/utils/auth_guard.dart';

class AppRoutes {
  static String inital = '/';
  static List<GetPage> routes = [
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      middlewares: [AuthGuard()],
      name: '/',
      page: () => RootScreen(),
      binding: BindingsBuilder(() {
        Get.put(
          UserController(),
        );
      }),
    ),
    GetPage(
      middlewares: [AuthGuard()],
      name: '/userPage',
      page: () => UserScreen(),
    ),
    GetPage(
      name: '/notification',
      page: () => NotificationScreen(),
    ),
    GetPage(
        middlewares: [AuthGuard()],
        name: '/userPage',
        page: () => UserScreen()),
    GetPage(name: '/testCouncel', page: () => CounselScreen()),
    GetPage(name: '/TestPage', page: () => TestPage()),
  ];
}
