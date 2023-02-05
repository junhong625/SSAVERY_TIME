// check and regist counsel screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:saffytime/screens/notification_screen.dart';

import '../controllers/my_councel.dart';
import '../controllers/pick_day_controller.dart';
import '../custom_button.dart';
import '../model/schedule_week.dart';
import '../widgets/councel_bottom_total.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffD3E4FF),
        onPressed: () {
          openCouncelBottomSheet(context);
        },
        child: Icon(Icons.add, color: Color(0xff0079D1)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        color: Colors.black12,

        child: CMyCouncel()
      )
    );
  }
}
