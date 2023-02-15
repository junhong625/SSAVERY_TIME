import 'package:get/get.dart';
import 'package:ssafytime/controllers/user_state_controller.dart';
import 'package:ssafytime/controllers/user_controller.dart';
import 'package:ssafytime/screens/counsel_screen.dart';
import 'package:ssafytime/screens/login_screen.dart';
import 'package:ssafytime/screens/notification_screen.dart';
import 'package:ssafytime/screens/root_screen.dart';
import 'package:ssafytime/screens/user_screen.dart';
import 'package:ssafytime/admin_councel_test_page.dart';
import 'package:ssafytime/user_councel_test_page.dart';
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
      binding: BindingsBuilder(() {
        UserController.to.fetchAttence();
        Get.put(UserStateController());
      }),
    ),
    GetPage(
      name: '/notification',
      page: () => NotificationScreen(),
    ),
    GetPage(
        middlewares: [AuthGuard()],
        name: '/userPage',
        page: () => UserScreen()),

    GetPage(name: '/CouncelPage', page: () => CounselScreen()),

    /// ==== 이하 테스트 용 ===============
    GetPage(name: '/UserCouncelTestPage', page: () => CounselScreen()),
    GetPage(name: '/AdminCouncelTestPage', page: () => AdminCouncelTestPage()),
    GetPage(name: '/TestPage', page: () => UserCouncelTestPage()),
  ];
}
