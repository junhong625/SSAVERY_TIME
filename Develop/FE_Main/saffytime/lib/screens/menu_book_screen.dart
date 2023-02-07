// check menubook screen
import 'package:flutter/material.dart';
import '../controllers/pick_day_controller.dart';
import '../custom_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/screens/notification_screen.dart';
import 'package:ssafytime/screens/user_screen.dart';

import '../model/menu_week.dart';
import '../widgets/day_of_week_pick_up.dart';
import '../widgets/menu_book_item.dart';
import '../widgets/menu_day_of_week.dart';

class MenuBookScreen extends StatefulWidget {
  const MenuBookScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MenuBookScreenStates();
}

class _MenuBookScreenStates extends State<MenuBookScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("식단표"),
        actions: <Widget>[
          IconButton(
            onPressed: () => Get.to(() => UserScreen()),
            icon: const FaIcon(
              FontAwesomeIcons.user,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => const NotificationScreen()),
            icon: const FaIcon(
              FontAwesomeIcons.bell,
              size: 20,
            ),
          ),
        ],
      ),
      body: SizedBox(
        child: Column(
          children: [
            MDay0fWeek(),
          ],
        )
      ),
    );
  }
}

