// check all notification screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/notification_controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("알림"),
        bottom: TabBar(
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          labelColor: const Color(0xff3396F4),
          indicatorColor: const Color(0xff3396F4),
          controller: controller.tabController,
          tabs: controller.myTabs,
        ),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
