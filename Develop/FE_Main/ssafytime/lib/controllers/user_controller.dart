import 'dart:developer';

import 'package:get/get.dart';
import 'package:ssafytime/controllers/councel_controller.dart';
import 'package:ssafytime/model/councel_detail.dart';
import 'package:ssafytime/models/attendance_model.dart';
import 'package:ssafytime/models/home_jobs_model.dart';
import 'package:ssafytime/models/home_menu_model.dart';
import 'package:ssafytime/models/notice_model.dart';
import 'package:ssafytime/models/recruitment.dart';
import 'package:ssafytime/models/schedule_now_model.dart';
import 'package:ssafytime/models/survey_model.dart';
import 'package:ssafytime/models/user_atten_model.dart';
import 'package:ssafytime/models/user_model.dart';
import 'package:ssafytime/repositories/home_repository.dart';
import 'package:ssafytime/repositories/user_repository.dart';
import 'package:ssafytime/services/auth_service.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

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

  var oncommingCouncel = CouncelDetail().obs; // 기한이 임박한 상담
  int councelTime = 999999999999;

  Recruitment recruitmentList = Recruitment(data: []);
  RxInt recruitCnt = 0.obs;

  @override
  void onInit() async {
    await fetchUser();
    await fetchHomeMenu();
    await fetchScheduleNow();
    await fetchAttence();
    await fetchNotice();
    setAtten();
    fetchRecruitmentInfo();
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
    log("수업 시간 : ${scheduleNow.value.data?.startTime} / ${scheduleNow.value.data
        ?.endTime}");
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

    log(
        "attendance : ${attenRaw['absentO']} / ${attenRaw['absentR']} / ${attenRaw['lateO']} / ${attenRaw['lateR']} / ${attenRaw['attenN']} / ${attenRaw['attenT']}");
    log("attendance : ${userAtten.value.absentO} / ${userAtten.value
        .absentR} / ${userAtten.value.lateO} / ${userAtten.value
        .lateR} / ${userAtten.value.attenN} / ${userAtten.value.attenT}");
  }

  Future fetchOncommingCouncel() async {
    int? userId = AuthService.to.user.value.userIdx;
    int? isAdmin = AuthService.to.user.value.isAdmin;

    if (userId == null || isAdmin == null) {
      return;
    }

    var res = await http
        .get(
        Uri.parse("http://i8a602.p.ssafy.io:9090/meet/${userId}/${isAdmin}"));
    var data = json.decode(res.body);

    var date = DateTime.now();
    int current = date.year * 100000000 + date.month * 1000000 +
        date.day * 10000 + date.hour * 100 + date.minute;

    for (int i = 0; i < data.length; i++) {
      final obj = CouncelDetail
          .fromJson(data[i])
          .obs;
      final int Time = calculatorTimeOfClass(
          obj.value.rezDate, obj.value.rezTime).round();
      if (obj.value.state == 2 && Time < councelTime) {
        councelTime = Time;
        oncommingCouncel = obj;
      }
    }
  }


  double calculatorTimeOfClass(DateTime? rezDate, double rezTime) {
    if (rezDate == null) {
      return 999999999999;
    }
    String year = rezDate.year.toString();
    String mon = rezDate.month.toString();
    String day = rezDate.day.toString();
    mon.length == 1 ? mon = '0' + mon : null;
    day.length == 1 ? day = '0' + day : null;
    String tmpDate = year + mon + day;
    double dateValue = double.parse(tmpDate);

    // 13.0 -> 1300 으로 , 14.5 -> 1430 으로
    double rezHour = rezTime;
    double rezMin = rezHour % 1;
    rezHour -= rezMin;
    double rezHourToMin = rezMin * 60;
    double timeFinal = rezHour * 100 + rezHourToMin;

    return dateValue * 10000 + timeFinal;
  }

  Future fetchRecruitmentInfo() async {
    var res = await http
        .get(
        Uri.parse("http://i8a602.p.ssafy.io:9090/job"));
    var data = json.decode(res.body);

    recruitmentList = Recruitment.fromJson(data);
    recruitCnt.value = recruitmentList.data!.length;
  }

}
