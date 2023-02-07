// user setting screen

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/custom_button.dart';
import 'package:ssafytime/screens/notification_screen.dart';

import '../controllers/councel_controller.dart';
import '../controllers/test_controller.dart';
import '../widgets/councel_list_item.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);


  // 테스트 컨트롤러 지워도 됨
  TestController testController = Get.put(TestController());
  // MyCouncelController controller = Get.put(MyCouncelController());
  MyCouncelController controller = Get.find<MyCouncelController>();


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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("UserScreen"),

            // 테스트용 지워도 됨
            CustomElevatedButton(
              onPressed: () {
                print(controller.myCouncelList);
              }
            ),

            ExpandableNotifier(
              child: Expandable(
                collapsed: ExpandableButton(
                  child: Container(width:150, height:100, color: Colors.purple,),
                ),
                expanded: Column(
                  children: [
                    Container(width:150, height:100, color: Colors.purple,),
                    ExpandableButton(child: Container(width:100, height:150,  color: Colors.yellow,),)
                  ],
                )
              ),
            ),

            /////////////// === ////////////////////////////
            ExpandableNotifier(
              child: Expandable(
                  collapsed: Column(
                    children: [
                      CouncelListItem(
                        startTime: controller.myCouncelStartTimeList[0],
                        endTime: controller.myCouncelEndTimeList[0],
                        rezTime: controller.myCouncelList.value[0].rezTime,
                        currentTime: controller.doubleTypeCurrentTime.value,
                        title: controller.myCouncelList[0].title,
                        reject : controller.myCouncelList[0].reject,
                      ),
                      ExpandableButton(
                        child: Container(width:150, height:50, color: Colors.purple,),
                      ),
                    ],
                  ),
                  expanded: Column(
                    children: [
                      CouncelListItem(
                      startTime: controller.myCouncelStartTimeList[0],
                      endTime: controller.myCouncelEndTimeList[0],
                      rezTime: controller.myCouncelList.value[0].rezTime,
                      currentTime: controller.doubleTypeCurrentTime.value,
                      title: controller.myCouncelList[0].title,
                      reject : controller.myCouncelList[0].reject,
                      ),
                      ExpandableButton(child: Container(width:100, height:50,  color: Colors.yellow,),)
                    ],
                  )
              ),
            ),

            // CouncelListItem(
            //   startTime: controller.startTime[0],
            //   endTime: controller.endTime[0],
            //   rezTime: controller.myCouncelList.value[0].rezTime,
            //   currentTime: controller.doubleTypeCurrentTime.value,
            //   title: controller.myCouncelList[0].title,
            //   reject : controller.myCouncelList[0].reject,
            // ),

          ],
        ),
      ),
    );
  }
}
