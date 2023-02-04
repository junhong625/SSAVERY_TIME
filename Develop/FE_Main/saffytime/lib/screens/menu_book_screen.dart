// check menubook screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:saffytime/screens/notification_screen.dart';
import 'package:saffytime/screens/user_screen.dart';

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
            onPressed: () => Get.to(() => const UserScreen()),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text("MenuBookScreen")],
        ),
      ),
    );
  }
}
