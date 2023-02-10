import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/models/user_custom_alarm.dart';
import 'package:ssafytime/models/noti_default_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:ssafytime/services/auth_service.dart';

// 알림 설정 관련 Controller
// 생성 인자값 : userIdx 유저 번호
// defaultAlarms { 기본 알림 설정
//      surveyNoti : 설문조사 알림 on/off
//      announceNoti : 공지사항 알림 on/off
//      counselNoti : 상담 알림 on/off
// }
// customState { 개인 알림 설정
//      title : 알림 제목
//      repeatDate : 반복 날짜
//      time : 알림 시간
//      isOn : 알림 on/off
// }

class UserStateController extends GetxController {
  late SharedPreferences pref;
  final defaultAlarms = UserDefaultState().obs;
  RxList<UserCustomAlarm> customState = <UserCustomAlarm>[].obs;
  RxList<Widget> displayCustomState = <Widget>[].obs;

  Rxn<DateTime> dateTime = Rxn<DateTime>(DateTime.now());
  RxList<String> dateSelected = <String>[].obs;
  final int? userIdx;

  UserStateController({this.userIdx});

  @override
  void onInit() async {
    super.onInit();
    pref = await SharedPreferences.getInstance();
    fetchCustomState();
    dateTime.value = DateTime.now();
  }

  @override
  void onClose() async {
    // fetchDefaultState();
    await pref.setStringList(
      "${userIdx}_noti",
      List<String>.from(
        customState.map(
          (e) => jsonEncode(e.toJson()),
        ),
      ),
    );
  }

// 내부 저장소에서 개인 알림 가져오기
  void fetchCustomState() async {
    final List<String>? customStateItems =
        pref.getStringList("${userIdx}_noti");
    if (customStateItems != null) {
      var item = List<UserCustomAlarm>.from(
          customStateItems.map((e) => UserCustomAlarm.fromRawJson(e)));
      customState.addAll(item);
      _setDisplayCustomState();
    }
  }

// 개인 알림 삭제
  void removeCustomState(int index) {
    customState.removeAt(index);
    displayCustomState.removeAt(index);
  }

// 개인 알림 위젯 설정
  void _setDisplayCustomState() {
    var item = List<Widget>.from(
      customState.map(
        (e) => Column(
          children: [
            SwitchListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              contentPadding: EdgeInsets.fromLTRB(32, 0, 16, 0),
              title: Text(e.title),
              value: e.isOn,
              onChanged: (bool value) {
                e.isOn = value;
              },
            ),
            Divider()
          ],
        ),
      ),
    );
    displayCustomState.addAll(item);
  }

// 개인 알림 추가
  void addCustomState(String title) {
    bool state = true;
    UserCustomAlarm custom = UserCustomAlarm(
        title: title,
        repeatDate: dateSelected,
        time: dateTime.value ?? DateTime.now(),
        isOn: state);
    customState.add(custom);
  }

// 서버에서 기본 알림 설정 가져오기
  void fetchDefaultState() async {
    var res = await http.get(
        Uri.parse(
            "http://i8a602.p.ssafy.io:9090/user/alarm/${AuthService.to.user.value.userIdx}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.to.accessToken}"
        });
    if (res.statusCode == 200) {
      defaultAlarms(UserDefaultState.fromJson(json.decode(res.body)['data']));
    }
  }
}
