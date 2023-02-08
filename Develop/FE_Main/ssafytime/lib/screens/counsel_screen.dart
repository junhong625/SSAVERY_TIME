// check and regist counsel screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/screens/notification_screen.dart';
import 'package:ssafytime/widgets/councel_admin_total.dart';

import '../widgets/councel_my_councel.dart';
import '../widgets/councel_bottom_total.dart';
import 'user_screen.dart';

class CounselScreen extends StatefulWidget {
  const CounselScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CounselScreenStates();
}

class _CounselScreenStates extends State<CounselScreen> {
  int userCode = 1; // 임시로 둔 것 유저 정보에서 가져와야 할 것
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
              onPressed: () => Get.to(() => NotificationScreen()),
              icon: const FaIcon(
                FontAwesomeIcons.bell,
                size: 20,
              ),
            ),
          ],
        ),
        floatingActionButton: Stack(
          children: [
            Align(
              alignment: Alignment(
                Alignment.bottomRight.x, Alignment.bottomRight.y - 0.1
              ),
              child: FloatingActionButton(
                backgroundColor: Color(0xffD3E4FF),
                onPressed: () {
                  openCouncelBottomSheet(context);
                },
                child: Icon(Icons.add, color: Color(0xff0079D1)),
              ),
                // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            ),

            if (userCode == 1) // 유저 코드가 1일 경우 == 관리자 일 경우 상단 신청을 확인한다.
            Align(
              alignment: Alignment(
              Alignment.bottomLeft.x + 0.15, Alignment.bottomLeft.y - 0.1),
              child: FloatingActionButton(
                backgroundColor: Color(0xffD3E4FF),
                onPressed: () {
                  // 관리자에게 온 상담 신청 목록 확인
                  openCouncelAdmin(context);
                },
              child: FaIcon(
                FontAwesomeIcons.check,
                size: 20,
                color: Color(0xff686ADB),
              ),
              ),
            )
          ],
        ),


        body: Container(color: Colors.black12, child: CMyCouncel()));
  }
}
