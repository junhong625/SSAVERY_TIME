import 'dart:developer';

import 'package:get/get.dart';
import 'package:ssafytime/models/attendance_model.dart';
import 'package:ssafytime/models/home_jobs_model.dart';
import 'package:ssafytime/models/home_menu_model.dart';
import 'package:ssafytime/models/notice_model.dart';
import 'package:ssafytime/models/schedule_now_model.dart';
import 'package:ssafytime/models/survey_model.dart';
import 'package:ssafytime/models/user_atten_model.dart';
import 'package:ssafytime/models/user_model.dart';
import 'package:ssafytime/repositories/home_repository.dart';
import 'package:ssafytime/repositories/user_repository.dart';
import 'package:ssafytime/services/auth_service.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  List<String> attenCategory = [
    "absentR",
    "absentO",
    "attenT",
    "attenN",
    "lateR",
    "lateO"
  ];

  final atten = AttenModel().obs;
  final menuToday = MenuToday().obs;
  final scheduleNow = ScheduleNow().obs;
  final jobInfo = JobInfo().obs;
  final homeSurvey = Survey().obs;
  final homeNotice = Notice().obs;

  final userAtten = UserAtten().obs;

  UserRepo userApi = UserRepo(token: AuthService.to.accessToken.value);
  HomeRepo homeApi = HomeRepo(token: AuthService.to.accessToken.value);

  @override
  void onInit() async {
    await fetchUser();
    await fetchHomeMenu();
    await fetchScheduleNow();
    await fetchAttence();
    await fetchNotice();
    setAtten();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> fetchUser() async {
    User? userInfo = await userApi.fetchUserInfo();
    log("${userInfo?.userEmail}");
    if (userInfo != null) {
      var fcmToken = await userApi.fetchFcmToken();
      bool res = await userApi.updateFcmToken(fcmToken);
      if (res) {
        log("Login : Success / FcmToken : Success");
        AuthService.to.user(userInfo);
      } else {
        log("Login : Success / FcmToken : Failed");
      }
    } else {
      log("Login : Failed / FcmToken : Failed");
    }
  }

  Future<void> fetchHomeMenu() async {
    menuToday(
        await homeApi.fetchMenuToday(AuthService.to.user.value.regionCode));
  }

  Future<void> fetchScheduleNow() async {
    scheduleNow(
        await homeApi.fetchScheduleNow(AuthService.to.user.value.trackCode));
    log("수업 시간 : ${scheduleNow.value.data?.startTime} / ${scheduleNow.value.data?.endTime}");
  }

  Future<void> fetchAttence() async {
    atten(await homeApi.fetchAttendence());
  }

  Future<void> fetchNotice() async {
    homeNotice(await homeApi.fetchNotice());
  }

  void setAtten() {
    Map<String, int> attenRaw = {};
    atten.value.attendance?.forEach(
        (e) => {attenRaw[attenCategory[e.category ?? 0]] = e.count ?? 0});

    userAtten(UserAtten(
      absentO: attenRaw['absentO'] ?? 0,
      absentR: attenRaw['absentR'] ?? 0,
      lateR: attenRaw['lateR'] ?? 0,
      lateO: attenRaw['lateO'] ?? 0,
      attenN: attenRaw['attenN'] ?? 0,
      attenT: attenRaw['attenT'] ?? 0,
    ));

    log("attendance : ${attenRaw['absentO']} / ${attenRaw['absentR']} / ${attenRaw['lateO']} / ${attenRaw['lateR']} / ${attenRaw['attenN']} / ${attenRaw['attenT']}");
    log("attendance : ${userAtten.value.absentO} / ${userAtten.value.absentR} / ${userAtten.value.lateO} / ${userAtten.value.lateR} / ${userAtten.value.attenN} / ${userAtten.value.attenT}");
  }
}
