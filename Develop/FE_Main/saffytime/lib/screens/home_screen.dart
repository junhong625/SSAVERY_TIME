// main screen

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:saffytime/screens/notification_screen.dart';
import 'package:saffytime/screens/user_screen.dart';
import 'package:saffytime/widgets/home_attendance_state_widget.dart';
import 'package:saffytime/widgets/home_employment_info_total_widget.dart';
import 'package:saffytime/widgets/home_schedule_item.dart';
import 'package:saffytime/widgets/notification_infomation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeScreenStates();
}

class _HomeScreenStates extends State<HomeScreen> {
  List<CNI> bannerItems = <CNI>[
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
    CNI(
        opacity: 0.4,
        myIcon: FontAwesomeIcons.pen,
        iconColor: 0xff0079D1,
        title: "취업 가능 여부",
        detail: Container(
          child: const Text("02.04 16:00 ~ 02.05 16:00",
              overflow: TextOverflow.ellipsis),
        ),
        isComplete: "완료"),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("1231234 김싸피"),
        actions: <Widget>[
          IconButton(
            onPressed: () => Get.to(() => const UserScreen()),
            icon: const FaIcon(
              FontAwesomeIcons.user,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => const NotificationScreen()),
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
            const HA(
                absent: 1,
                attendance: 1,
                tardy: 2,
                imgURL: "assets/image/no_profile_image.png"),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const HSIW(
                      color: 0xff3094F2,
                      category: "알고리즘",
                      studyPlace: "오프라인",
                      subject: "잘먹고 잘사는법",
                      content: "돈이면 다 된다",
                      classTime: "16:00 ~ 18:00",
                      isClassTime: false,
                      progressPercent: 0.4),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              width: double.infinity,
              color: Colors.white,
              child: const HEIT(
                infoList: [
                  ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                  ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                  ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                  ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                  ["현대오토에버", "토요일 코딩테스트", "2023.01.15 ~ 2023.01.30"],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
