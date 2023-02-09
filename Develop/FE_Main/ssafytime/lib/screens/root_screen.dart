import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/bottom_navbar_controller.dart';
import 'package:ssafytime/screens/calendar_screen.dart';
import 'package:ssafytime/screens/counsel_screen.dart';
import 'package:ssafytime/screens/home_screen.dart';
import 'package:ssafytime/screens/menu_book_screen.dart';
import 'package:ssafytime/widgets/bottom_navbar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);
  static List<Widget> tabPages = <Widget>[
    HomeScreen(),
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
