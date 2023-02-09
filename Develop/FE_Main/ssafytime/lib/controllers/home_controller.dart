import 'dart:developer';

import 'package:get/get.dart';
import 'package:ssafytime/models/attendance_model.dart';
import 'package:ssafytime/models/home_jobs_model.dart';
import 'package:ssafytime/models/home_menu_model.dart';
import 'package:ssafytime/models/schedule_now_model.dart';
import 'package:ssafytime/models/survey_model.dart';
import 'package:ssafytime/repositories/home_repository.dart';
import 'package:ssafytime/services/auth_service.dart';

class HomeController extends GetxController {
  Rx<HomeMenu?> homeMenu = Rx<HomeMenu?>(null);
  Rx<ScheduleNow?> scheduleNow = Rx<ScheduleNow?>(null);
  Rx<AttenModel?> userAtten = Rx<AttenModel?>(null);
  Rx<JobInfo?> jobInfo = Rx<JobInfo?>(null);
  Rx<SurveyModel?> homeSurvey = Rx<SurveyModel?>(null);
  final int userIdx;
  final int regionCode;
  final int trackCode;

  HomeRepo homeApi = HomeRepo(token: AuthService.to.token ?? "");

  HomeController(
      {required this.userIdx,
      required this.regionCode,
      required this.trackCode});

  @override
  void onInit() async {
    await fetchHomeMenu();
    await fetchScheduleNow();
    await fetchAttence();
    super.onInit();
  }

  Future<void> fetchHomeMenu() async {
    homeMenu.value = await homeApi.fetchHomeMenu(regionCode);
  }

  Future<void> fetchScheduleNow() async {
    scheduleNow.value = await homeApi.fetchScheduleNow(trackCode);
    log("sheduleNow : ${scheduleNow.value?.data.startTime} / ${scheduleNow.value?.data.endTime}");
  }

  Future<void> fetchAttence() async {
    userAtten.value = await homeApi.fetchAttendence();
  }
}
