import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ssafytime/repositories/notification_repository.dart';
import 'package:ssafytime/services/auth_service.dart';
import 'package:ssafytime/widgets/notification_infomation.dart';

class NotificationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static NotificationController get to => Get.find();
  var count = 0.obs;

  final notiList = [
    <dynamic>[].obs,
    <dynamic>[].obs,
    <dynamic>[].obs,
    <dynamic>[].obs,
  ];
  final notiListWidgets = <Widget>[].obs;

  final dateF = new DateFormat("yy/MM/dd");
  final timeF = new DateFormat("yy/MM/dd HH:mm");

  final NotiRepo notiApi = NotiRepo(token: AuthService.to.accessToken.value);

  late TabController tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(
      child: Text("전체"),
    ),
    const Tab(
      child: Text("공지사항"),
    ),
    const Tab(
      child: Text("설문조사"),
    ),
    const Tab(
      child: Text("상담"),
    ),
  ];

  @override
  void onInit() async {
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController.addListener(() {
      log("tab num : ${tabController.index}");
      fetchNotiListWidgets();
    });
    await fetchNotiList();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> fetchNotiList() async {
    notiList[0].clear();
    notiList[1].clear();
    notiList[2].clear();
    notiList[3].clear();
    await fetchNoticeList();
    await fetchSurveyList();
    await fetchCounselList();
    notiList[0].sort((b, a) => a.createDateTime.compareTo(b.createDateTime));
    notiList[1].sort((b, a) => a.createDateTime.compareTo(b.createDateTime));
    notiList[2].sort((b, a) => a.createDateTime.compareTo(b.createDateTime));
    notiList[3].sort((b, a) => a.createDateTime.compareTo(b.createDateTime));
    fetchNotiListWidgets();
  }

  Future<void> fetchSurveyList() async {
    var data = await notiApi.fetchSurveryList();
    if (data != null) {
      data.forEach((e) {
        notiList[0].add(e);
        notiList[2].add(e);
      });
    }
  }

  Future<void> fetchNoticeList() async {
    var data = await notiApi.fetchNoticeList();
    if (data != null) {
      data.forEach((e) {
        notiList[0].add(e);
        notiList[1].add(e);
      });
    }
  }

  Future<void> fetchCounselList() async {
    var data = await notiApi.fetchCounselList(
        AuthService.to.user.value.userIdx, AuthService.to.user.value.isAdmin);
    if (data != null) {
      data.forEach((e) {
        notiList[0].add(e);
        notiList[3].add(e);
      });
    }
  }

  void fetchNotiListWidgets() {
    notiListWidgets.clear();
    notiList[tabController.index].forEach(
      (element) {
        switch (element.notiType) {
          case 1:
            notiListWidgets.add(CNI(
                opacity: 1,
                myIcon: FontAwesomeIcons.bullhorn,
                iconColor: 0xffFF5449,
                title: element.title,
                detail: Text(timeF.format(element.createDateTime)),
                isComplete: ""));
            notiListWidgets.add(Divider(
              height: 4,
            ));
            break;
          case 2:
            notiListWidgets.add(GestureDetector(
              child: CNI(
                  opacity: 1,
                  myIcon: FontAwesomeIcons.pen,
                  iconColor: 0xff0079D1,
                  title: element.title,
                  detail: Text(
                      "${timeF.format(element.startDate)} ~ ${timeF.format(element.endDate)}"),
                  isComplete: ""),
              onTap: () {
                Get.defaultDialog(
                  title: "",
                  titlePadding: EdgeInsets.only(top: 0, bottom: 0),
                  content: Text("설문을 진행하시겠습니까?"),
                  textConfirm: "계속",
                  textCancel: "취소",
                  onConfirm: () {
                    Get.back();
                    Get.toNamed('/survey', arguments: element.surveyIdx);
                  },
                );
              },
            ));
            notiListWidgets.add(Divider(
              height: 4,
            ));
            break;
          case 3:
            notiListWidgets.add(CNI(
                opacity: 1,
                myIcon: FontAwesomeIcons.userGroup,
                iconColor: 0xff686ADB,
                title: element.title,
                detail:
                    Text("${dateF.format(element.rezDate)} ${element.rezTime}"),
                isComplete: ""));
            notiListWidgets.add(Divider(
              height: 4,
            ));
            break;
        }
      },
    );
  }
}
