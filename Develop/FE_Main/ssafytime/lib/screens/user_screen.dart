// user setting screen

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/user_controller.dart';
import 'package:ssafytime/controllers/user_state_controller.dart';
import 'package:ssafytime/services/auth_service.dart';
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
  UserController userC = UserController.to;
  UserStateController stateC = Get.find<UserStateController>();
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

  late bool stateNoticeAlarm = stateC.defaultAlarms.value.noticeAlarm ?? true;
  bool stateSurveyAlarm = true;
  bool stateConsultingAlarm = true;

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
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MUI(
                name: AuthService.to.user.value.userName,
                studentID: AuthService.to.user.value.userIdx,
                imgURL: AuthService.to.user.value.userImg,
              ),
              Divider(),
              MAW(
                absentO: userC.userAtten.value.absentO,
                absentR: userC.userAtten.value.absentR,
                lateR: userC.userAtten.value.lateR,
                lateO: userC.userAtten.value.lateO,
                attenN: userC.userAtten.value.attenN,
                attenT: userC.userAtten.value.attenT,
              ),
              Divider(),
              MMileage(myMileage: AuthService.to.user.value.mileage),
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
                    defaultAlarmListTile(stateNoticeAlarm, "공지사항 알림"),
                    defaultAlarmListTile(
                        stateC.defaultAlarms.value.surveyAlarm ?? true,
                        "설문조사 알림"),
                    defaultAlarmListTile(
                        stateC.defaultAlarms.value.consultingAlarm ?? true,
                        "상담 알림"),
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
                                    stateC.dateSelected.clear();
                                  },
                                  content: Obx(() => setCustomAlarmDialog()),
                                );
                              },
                              icon: FaIcon(FontAwesomeIcons.plus))
                        ],
                      ),
                    ),
                    stateC.displayCustomState.length > 0
                        ? Column(
                            children: [
                              for (int i = 0;
                                  i < stateC.customState.length;
                                  i++) ...[
                                SwitchListTile(
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(32, 0, 16, 0),
                                  title: Text(stateC.customState[i].title),
                                  value: stateC.customState[i].isOn,
                                  onChanged: (value) =>
                                      {stateC.customState[i].isOn = value},
                                ),
                                Divider()
                              ]
                            ],
                          )
                        : Text("${_titleController.text}")
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    AuthService.to.logout();
                  },
                  child: Text("로그아웃")),
            ],
          ),
        ),
      ),
    );
  }

  Widget defaultAlarmListTile(bool state, String title) {
    return Column(
      children: [
        SwitchListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.fromLTRB(32, 0, 16, 0),
          title: Text(title),
          value: state,
          onChanged: (bool value) {
            setState(() {
              state = value;
            });
          },
        ),
        Divider()
      ],
    );
  }

  Widget setCustomAlarmDialog() {
    return Column(
      children: [
        TimePickerSpinner(
          is24HourMode: false,
          itemHeight: 40,
          itemWidth: 60,
          onTimeChange: (time) {
            stateC.dateTime.value = time;
          },
        ),
        TextField(
          controller: _titleController,
          decoration: InputDecoration(labelText: "알람 제목"),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: dateSelect.keys
                .map(
                  ((e) => FilterChip(
                        showCheckmark: false,
                        label: Text(e),
                        onSelected: (bool value) {
                          if (value) {
                            if (!stateC.dateSelected.contains(e)) {
                              stateC.dateSelected.add(e);
                            }
                          } else {
                            stateC.dateSelected
                                .removeWhere((element) => element == e);
                          }
                        },
                        selected: stateC.dateSelected.contains(e),
                      )),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
