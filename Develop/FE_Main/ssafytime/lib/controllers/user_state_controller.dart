import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ssafytime/models/user_custom_alarm.dart';
import 'package:ssafytime/models/noti_default_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:ssafytime/services/auth_service.dart';
import 'package:ssafytime/services/noti_service.dart';

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
  final defaultAlarms = UserDefaultState(
          noticeAlarm: true, surveyAlarm: true, consultingAlarm: true)
      .obs;
  RxList<UserCustomAlarm> customState = <UserCustomAlarm>[].obs;

  Rxn<DateTime> dateTime = Rxn<DateTime>(DateTime.now());
  RxList<String> dateSelected = <String>[].obs;
  final int? userIdx = AuthService.to.user.value.userIdx;

//   UserStateController({this.userIdx});

  @override
  void onInit() async {
    log("onInit");
    initDateSelectItem();
    pref = await SharedPreferences.getInstance();
    await fetchDefaultState();
    await fetchCustomState();
    dateTime.value = DateTime.now();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    saveCustomState();
  }

// 내부 저장소에서 개인 알림 가져오기
  Future<void> fetchCustomState() async {
    final List<String>? customStateItems =
        pref.getStringList("${userIdx}_noti");
    if (customStateItems != null) {
      var item = List<UserCustomAlarm>.from(
          customStateItems.map((e) => UserCustomAlarm.fromRawJson(e)));
      log(customStateItems.toString());
      customState.addAll(item);
    }
  }

// 개인 알림 추가
  void addCustomState(String title) async {
    bool state = true;
    UserCustomAlarm custom = UserCustomAlarm(
        title: title,
        repeatDate: _calcDayOfWeek(),
        time: dateTime.value ?? DateTime.now(),
        isOn: state,
        dateSelected: dateSelected);
    customState.add(custom);
    await NotiService.to
        .addAlarm(title, dateTime.value ?? DateTime.now(), _calcDayOfWeek());
    saveCustomState();
  }

// 개인 알림 삭제
  void removeCustomState(int index) async {
    await NotiService.to.removeAlarm(customState[index].repeatDate);
    customState.removeAt(index);
    saveCustomState();
  }

// 개인 알림 켜기
  void onCustomState(int idx) async {
    await NotiService.to.addAlarm(customState[idx].title, customState[idx].time,
        customState[idx].repeatDate);
    saveCustomState();
  }

// 개인 알림 끄기
  void offCustomState(int idx) async {
    await NotiService.to.removeAlarm(customState[idx].repeatDate);
    saveCustomState();
  }

// 개인 알림 저장
  void saveCustomState() async {
    List<String> saveCustomAlarm = [];
    customState.forEach((e) {
      saveCustomAlarm.add(e.toRawJson());
    });

    await pref.setStringList("${userIdx}_noti", saveCustomAlarm);
  }

// 서버에서 기본 알림 설정 가져오기
  Future<void> fetchDefaultState() async {
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

  Future<void> setDefaultState() async {}

  List<DateTime> _calcDayOfWeek() {
    DateTime _now = new DateTime.now();
    List<DateTime> dayOfWeeks = List<DateTime>.from(dateSelected.map((e) {
      switch (e) {
        case "월":
          return _now.subtract(Duration(days: _now.weekday - 1));
        case "화":
          return _now.subtract(Duration(days: _now.weekday - 2));
        case "수":
          return _now.subtract(Duration(days: _now.weekday - 3));
        case "목":
          return _now.subtract(Duration(days: _now.weekday - 4));
        case "금":
          return _now.subtract(Duration(days: _now.weekday - 5));
        case "토":
          return _now.subtract(Duration(days: _now.weekday - 6));
        case "일":
          return _now.subtract(Duration(days: _now.weekday - 7));
      }
    }));

    return dayOfWeeks;
  }

  void initDateSelectItem() {
    log("onReady");
    dateSelected.clear();
    String todayE = DateFormat.E('ko_KR').format(DateTime.now());
    dateSelected.add(todayE);
  }

  void updateNoticeAlarm(bool value) async {
    var res = await http.patch(
        Uri.parse(
            "http://i8a602.p.ssafy.io:9090/user/alarm/notice/${AuthService.to.user.value.userIdx}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.to.accessToken}"
        });
    log("update Notice status : ${res.statusCode}");
    if (res.statusCode == 200) {
      defaultAlarms.value.noticeAlarm = value;
    }
  }

  void updateSurveyAlarm(bool value) async {
    var res = await http.patch(
        Uri.parse(
            "http://i8a602.p.ssafy.io:9090/user/alarm/survey/${AuthService.to.user.value.userIdx}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.to.accessToken}"
        });
    log("update Survey status : ${res.statusCode}");
    if (res.statusCode == 200) {
      defaultAlarms.value.surveyAlarm = value;
    }
  }

  void updateCounselAlarm(bool value) async {
    var res = await http.patch(
        Uri.parse(
            "http://i8a602.p.ssafy.io:9090/user/alarm/consulting/${AuthService.to.user.value.userIdx}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.to.accessToken}"
        });
    log("update Counsel status : ${res.statusCode}");
    if (res.statusCode == 200) {
      defaultAlarms.value.consultingAlarm = value;
    }
  }

  void checkout() {
    log("${_calcDayOfWeek().toString()}");
    log("${DateTime.now().toIso8601String()}");
  }
}
