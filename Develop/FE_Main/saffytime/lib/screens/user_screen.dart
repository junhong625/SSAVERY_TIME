// user setting screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:saffytime/custom_button.dart';
import 'package:saffytime/screens/notification_screen.dart';

import '../controllers/councel_bottom_councelor.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);


  // 테스트 컨트롤러 지워도 됨
  CBCouncelorController testController = Get.put(CBCouncelorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지"),
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell),
            onPressed: () => {Get.to(() => const NotificationScreen())},
          ),
        ],
      ),
      body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("UserScreen"),

            // 테스트용 지워도 됨
            CustomElevatedButton(
              onPressed: () {
                testController.requestCouncelor(1, 2);
              }
            )
          ],
        ),
      ),
    );
  }
}
