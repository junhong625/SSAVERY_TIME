// check all notification screen
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:saffytime/controllers/notification_tabbar_controller.dart';

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
              onPressed: () => {},
              icon: const FaIcon(
                FontAwesomeIcons.user,
                size: 20,
              ),
            )
          ],
          bottom: TabBar(
            indicatorColor: const Color(0xff3396F4),
            controller: controller.tabController,
            tabs: controller.myTabs,
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: const [],
        ));
  }
}
