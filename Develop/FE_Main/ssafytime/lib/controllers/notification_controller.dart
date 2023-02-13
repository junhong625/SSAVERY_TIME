import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/models/notice_model.dart';
import 'package:ssafytime/services/auth_service.dart';

class NotificationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static NotificationController get to => Get.find();
  var count = 0.obs;

  final notiList = <dynamic>[].obs;

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
  void onInit() async {
    tabController = TabController(length: myTabs.length, vsync: this);
    await fetchNoticeList();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> fetchSurveyList() async {
    var res = await http.get(Uri.parse("http://i8a602.p.ssafy.io:9090/"));
  }

  Future<void> fetchNoticeList() async {
    var res =
        await http.get(Uri.parse("http://i8a602.p.ssafy.io:9090/notice/all"));

    if (res.statusCode == 200) {
      var data = NoticeList.fromRawJson(res.body).data;
      data!.forEach((e) {
        notiList.add(e);
      });

      log("공지 개수 : ${notiList.length}");
    }
  }

  Future<void> fetchCounselList() async {
    var res = await http.get(Uri.parse(
        "http://i8a602.p.ssafy.io:9090/meet/${AuthService.to.user.value.userIdx}/${AuthService.to.user.value.isAdmin}"));
    if (res.statusCode == 200) {
      List<dynamic> data = json.decode(res.body);
      log("${data.length}");
    }
  }
}
