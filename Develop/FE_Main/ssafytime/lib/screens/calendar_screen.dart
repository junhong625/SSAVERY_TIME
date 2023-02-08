// check calendar screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/screens/notification_screen.dart';
import 'package:ssafytime/screens/user_screen.dart';

import '../widgets/schedule_day_of_week.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CalendarScreenStates();
}

class _CalendarScreenStates extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("시간표"),
        actions: <Widget>[
          IconButton(
            onPressed: () => Get.to(() => UserScreen()),
            icon: const FaIcon(
              FontAwesomeIcons.user,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => NotificationScreen()),
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
            SDay0fWeek(),
          ],
        ),
      ),
    );
  }
}
