// check and regist counsel screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:saffytime/screens/notification_screen.dart';

import 'user_screen.dart';

class CounselScreen extends StatefulWidget {
  const CounselScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CounselScreenStates();
}

class _CounselScreenStates extends State<CounselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("상담"),
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
          children: const [Text("CounselScreen")],
        ),
      ),
    );
  }
}
