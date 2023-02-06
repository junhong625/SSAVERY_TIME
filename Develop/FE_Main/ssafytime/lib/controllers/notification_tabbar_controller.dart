import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static NotificationTabBarController get to => Get.find();
  var count = 0.obs;

  late TabController tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(
      child: Text("전체"),
    ),
    const Tab(
      child: Text("설문조사"),
    ),
    const Tab(
      child: Text("공지사항"),
    ),
    const Tab(
      child: Text("상담"),
    ),
  ];

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void increase() {
    count++;
  }
}
