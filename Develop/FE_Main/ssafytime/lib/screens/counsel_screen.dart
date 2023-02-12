// check and regist counsel screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/screens/notification_screen.dart';
import 'package:ssafytime/services/auth_service.dart';
import 'package:ssafytime/widgets/councel_admin_councel.dart';
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
  int userCode = AuthService.to.user.value.isAdmin;
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
        floatingActionButton: _getFAB(),
            // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        // body: Container(color: Colors.black12, child: CMyCouncel()));
        body: Container(
          color: Colors.white,
          child: userCode == 1 ? CMyCouncel() : CAdminCouncel()
        )
    );
  }

  // admin == 1 일때, 학생일때만 상담 신청 버튼이 있고 관리자는 없음
  Widget _getFAB() {
    if (AuthService.to.user.value.isAdmin == 0) {
      return SizedBox();
    } else {
      return FloatingActionButton(
        backgroundColor: Color(0xffD3E4FF),
        onPressed: () {
          openCouncelBottomSheet(context);
        },
        child: Icon(Icons.add, color: Color(0xff0079D1)),
      );
    }
  }
}
