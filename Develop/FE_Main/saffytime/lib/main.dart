import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffytime/controllers/bottom_navbar_controller.dart';
import 'package:saffytime/screens/calendar_screen.dart';
import 'package:saffytime/screens/counsel_screen.dart';
import 'package:saffytime/screens/home_screen.dart';
import 'package:saffytime/screens/menu_book_screen.dart';
import 'package:saffytime/screens/survey_screen.dart';
import 'package:saffytime/widgets/bottom_navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SurveyScreen());
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);
  static List<Widget> tabPages = <Widget>[
    const HomeScreen(),
    const CalendarScreen(),
    const MenuBookScreen(),
    const CounselScreen()
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationBarController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => SafeArea(
          child: tabPages[BottomNavigationBarController.to.selectedIdx.value])),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
