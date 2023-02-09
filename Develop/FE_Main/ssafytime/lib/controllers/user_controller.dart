import 'dart:developer';

import 'package:get/get.dart';
import 'package:ssafytime/models/attendance_model.dart';
import 'package:ssafytime/models/home_jobs_model.dart';
import 'package:ssafytime/models/home_menu_model.dart';
import 'package:ssafytime/models/schedule_now_model.dart';
import 'package:ssafytime/models/survey_model.dart';
import 'package:ssafytime/models/user_model.dart';
import 'package:ssafytime/repositories/home_repository.dart';
import 'package:ssafytime/repositories/user_repository.dart';
import 'package:ssafytime/services/auth_service.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  List<String> attenCategory = [
    "absentR",
    "absentO",
    "AttenT",
    "AttenN",
    "lateR",
    "lateO"
  ];

  Rxn<User> user = Rxn<User>();
  Rxn<AttenModel> atten = Rxn<AttenModel>();
  Rxn<HomeMenu> homeMenu = Rxn<HomeMenu>();
  Rxn<ScheduleNow> scheduleNow = Rxn<ScheduleNow>();
  Rxn<JobInfo> jobInfo = Rxn<JobInfo>();
  Rxn<SurveyModel> homeSurvey = Rxn<SurveyModel>();

  Rxn<Map<String, int>> userAtten = Rxn<Map<String, int>>();

  UserRepo userApi = UserRepo(token: AuthService.to.token ?? "");
  HomeRepo homeApi = HomeRepo(token: AuthService.to.token ?? "");

  @override
  void onInit() async {
    await fetchUser();
    await fetchHomeMenu();
    await fetchScheduleNow();
    await fetchAttence();
    setAtten();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> fetchUser() async {
    user.value = await userApi.fetchUserInfo();
    log("${user.value?.userEmail}");
    if (user.value != null) {
      var fcmToken = await userApi.fetchFcmToken();
      bool res = await userApi.updateFcmToken(fcmToken);
      if (res) {
        log("Login : Success / FcmToken : Success");
      } else {
        log("Login : Success / FcmToken : Failed");
      }
    } else {
      log("Login : Failed / FcmToken : Failed");
    }
  }

  Future<void> fetchHomeMenu() async {
    homeMenu.value = await homeApi.fetchHomeMenu(user.value?.regionCode);
  }

  Future<void> fetchScheduleNow() async {
    scheduleNow.value = await homeApi.fetchScheduleNow(user.value?.trackCode);
    log("수업 시간 : ${scheduleNow.value?.data.startTime} / ${scheduleNow.value?.data.endTime}");
  }

  Future<void> fetchAttence() async {
    atten.value = await homeApi.fetchAttendence();
  }

  String getUserIdName() {
    return "${user.value?.userIdx ?? "000000"} ${user.value?.userName ?? "NAME"}";
  }

  void setAtten() {
    userAtten.value?.clear();
    atten.value?.attendance
        .map((e) => {userAtten.value?[attenCategory[e.category]] = e.count});
  }
}
