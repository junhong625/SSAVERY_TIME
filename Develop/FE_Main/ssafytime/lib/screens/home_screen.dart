// main screen

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/user_controller.dart';
import 'package:ssafytime/services/auth_service.dart';
import 'package:ssafytime/widgets/home_attendance_state_widget.dart';
import 'package:ssafytime/widgets/home_employment_info_total_widget.dart';
import 'package:ssafytime/widgets/home_schedule_item.dart';
import 'package:ssafytime/widgets/notification_infomation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  final UserController userC = Get.find<UserController>();

  @override
  State<StatefulWidget> createState() => _HomeScreenStates();
}

class _HomeScreenStates extends State<HomeScreen> {
  @override
  initState() {
    log("현재 class : ${widget.userC.scheduleNow.value.data?.title}");
    super.initState();
  }

  List<Widget> bannerItems = <Widget>[
    CNI(
        opacity: 1,
        myIcon: FontAwesomeIcons.bullhorn,
        iconColor: 0xffFF5449,
        title: "전면 마스크해제",
        detail: Container(
          child: const Text(
            "이제 오프라인 전면 마스크해제합니다",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        isComplete: "진행"),
    ElevatedButton(
        onPressed: () {
          AuthService.to.isLogin = false;
        },
        child: Text("로그인 해제")),
    CNI(
        opacity: 1,
        myIcon: FontAwesomeIcons.userGroup,
        iconColor: 0xff686ADB,
        title: "마스크해제 상담",
        detail: Container(
          child: const Text("마스크 해제 반대 청원 (얼굴 보호)",
              overflow: TextOverflow.ellipsis),
        ),
        isComplete: "예정"),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
              "${AuthService.to.user.value.userIdx} ${AuthService.to.user.value.userName}"),
          actions: <Widget>[
            IconButton(
              onPressed: () => Get.toNamed('/userPage'),
              icon: const FaIcon(
                FontAwesomeIcons.user,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: () => Get.toNamed('/notification'),
              icon: const FaIcon(
                FontAwesomeIcons.bell,
                size: 20,
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HA(
                  absent: widget.userC.userAtten.value.absentO ?? 0,
                  attendance: widget.userC.userAtten.value.attenN ?? 0,
                  tardy: widget.userC.userAtten.value.lateO ?? 0,
                  imgURL: AuthService.to.user.value.userImg),
              // CarouselSlider =========================================
              Container(
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                color: Colors.white,
                child: CarouselSlider(
                  items: bannerItems,
                  options: CarouselOptions(
                    height: 68,
                    viewportFraction: 1,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: const Text(
                        "시간표",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    HSIW(
                      category:
                          widget.userC.scheduleNow.value.data?.category ?? 0,
                      onOff: widget.userC.scheduleNow.value.data?.onOff ?? 0,
                      title: widget.userC.scheduleNow.value.data?.title ??
                          "일과시간 종료",
                      subTitle: widget.userC.scheduleNow.value.data?.subTitle ??
                          "등록된 일과가 없습니다",
                      startTime:
                          widget.userC.scheduleNow.value.data?.startTime ??
                              DateTime.now().hour + 9,
                      endTime: widget.userC.scheduleNow.value.data?.endTime ??
                          DateTime.now().hour + 10,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  width: double.infinity,
                  color: Colors.white,
                  child: HEIT(
                    infoList: [
                      ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                      ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                      ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                      ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                      ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
