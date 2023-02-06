// user setting screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/auth_controller.dart';
import 'package:ssafytime/controllers/noti_state_controller.dart';
import 'package:ssafytime/screens/notification_screen.dart';
import 'package:ssafytime/widgets/user_screen_attendance_state_widget.dart';
import 'package:ssafytime/widgets/user_screen_mileage.dart';
import 'package:ssafytime/widgets/user_screen_user_info_widget.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

// enum dateSelect { "dnjf", Tue, Wed, Tur, Fri }

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserScreenStates();
}

class _UserScreenStates extends State<UserScreen> {
  AuthController authController = Get.find<AuthController>();
  NotiStateController stateController =
      Get.put(NotiStateController(Get.arguments ?? 0));
  TextEditingController _titleController = TextEditingController();
  String test = "테스트";
  DateTime _dateTime = DateTime.now();
  var dateSelect = {
    "월": 0,
    "화": 1,
    "수": 2,
    "목": 3,
    "금": 4,
    "반복": 5,
  };
//   final List<String> dateSelected = <String>[];
//   List<bool> dateValue = [false, false, false, false, false];
  List<int> userAttendance = [0, 0, 0, 0, 0, 0]; // User 출결현황 데이터 확인

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지"),
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell),
            onPressed: () => {Get.to(() => NotificationScreen())},
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MUI(name: "김싸피", studentID: 123456),
              Divider(),
              MAW(stateCntList: userAttendance),
              Divider(),
              MMileage(myMileage: 5000000),
              Divider(),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "기본 알림 설정",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    stateController.displayDefaultState.length > 0
                        ? Column(children: stateController.displayDefaultState)
                        : Text("데이터가 없습니다"),
                  ],
                ),
              ),
              Divider(),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "개인 알림 설정",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "알람 설정",
                                  textConfirm: "등록",
                                  textCancel: "취소",
                                  onCancel: () {
                                    _titleController.clear();
                                    stateController.dateSelected.clear();
                                  },
                                  content: Obx(
                                    () => Column(
                                      children: [
                                        TimePickerSpinner(
                                          is24HourMode: false,
                                          itemHeight: 40,
                                          itemWidth: 60,
                                          onTimeChange: (time) {
                                            stateController.dateTime.value =
                                                time;
                                          },
                                        ),
                                        TextField(
                                          controller: _titleController,
                                          decoration: InputDecoration(
                                              labelText: "알람 제목"),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: dateSelect.keys
                                                .map(
                                                  ((e) => FilterChip(
                                                        showCheckmark: false,
                                                        label: Text(e),
                                                        onSelected:
                                                            (bool value) {
                                                          if (value) {
                                                            if (!stateController
                                                                .dateSelected
                                                                .contains(e)) {
                                                              stateController
                                                                  .dateSelected
                                                                  .add(e);
                                                            }
                                                          } else {
                                                            stateController
                                                                .dateSelected
                                                                .removeWhere(
                                                                    (element) =>
                                                                        element ==
                                                                        e);
                                                          }
                                                        },
                                                        selected:
                                                            stateController
                                                                .dateSelected
                                                                .contains(e),
                                                      )),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              icon: FaIcon(FontAwesomeIcons.plus))
                        ],
                      ),
                    ),
                    stateController.displayCustomState.length > 0
                        ? Column(
                            children: stateController.displayCustomState,
                          )
                        : Text("${_titleController.text}")
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    authController.logout();
                  },
                  child: Text("로그아웃")),
            ],
          ),
        ),
      ),
    );
  }
}
