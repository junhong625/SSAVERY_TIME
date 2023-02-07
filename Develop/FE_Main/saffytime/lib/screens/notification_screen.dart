// check all notification screen
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/notification_tabbar_controller.dart';
import 'package:ssafytime/screens/user_screen.dart';

class NotificationScreen extends GetView<NotificationTabBarController> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationTabBarController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("알림"),
        actions: <Widget>[
          IconButton(
            onPressed: () => {Get.to(() => UserScreen())},
            icon: const FaIcon(
              FontAwesomeIcons.user,
              size: 20,
            ),
          )
        ],
        bottom: TabBar(
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          labelColor: const Color(0xff3396F4),
          indicatorColor: const Color(0xff3396F4),
          controller: controller.tabController,
          tabs: controller.myTabs,
        ),
      ),
      body: Container(
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "${controller.count.value}",
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () => {
                  controller.increase(),
                },
                child: const Text("추가"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
