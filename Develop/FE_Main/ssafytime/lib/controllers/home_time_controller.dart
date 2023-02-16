import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:ssafytime/model/home_menu.dart';
import 'package:ssafytime/model/home_schedule.dart';
import 'package:ssafytime/services/auth_service.dart';

class HomeTimeController extends GetxController {
  late var timer;
  // DateTime currentTime = DateTime.now().add(Duration(hours: 9));
  static Map table = {
    0: {'category': '', 'color': 0xff000000}, // 데이터 없음 무제
    1: {'category': '알고리즘', 'color': 0xff0082A1},
    2: {'category': '코딩과정', 'color': 0xff686ADB},
    3: {'category': '프로젝트', 'color': 0xffDE3730},
    4: {'category': '기타', 'color': 0xff0079D1},
  };

  static Map studyPlace = {
    0: '온라인',
    1: '오프라인',
    2: '' // 데이터 없음 or 일과 종료
  };

  // DateTime currentTime = DateTime.now().add(Duration(hours: 9));
  DateTime currentTime = DateTime.now();
  RxInt hour = 0.obs; // 현재 시간 (시)
  int min = 0; // 현재 시간 (분)
  int scheduleHour = 0; // 시간표 시간(시작 시간)
  int scheduleHourEnd = 0; // 시간표 시간(끝나는 시간)
  int totalTime = 0; // 전제 시간
  HomeSchedule nowSchedule = HomeSchedule(); // 현재 시간표
  int nextTime = 0; // 50 분에 다음꺼 조회하기 위한 파람쓰
  int trackCode = AuthService.to.user.value.trackCode ?? 0;
  int regionCode = AuthService.to.user.value.regionCode ?? 0;

  HomeMenu todayMenu = HomeMenu(); // 오늘 메뉴

  // getx 변수
  RxBool isClassTime = true.obs;
  RxDouble percent = 0.0.obs; // 현재 시간 퍼센트
  RxInt color = 0xff000000.obs; // 색상
  RxString category = ''.obs; // 카테고리
  RxString onoff = ''.obs; // 온라인? 오프라인?
  RxString title = ''.obs; //
  RxString subTitle = ''.obs; //
  RxString classTime = ''.obs; // 수업 시간 표시용, 스트링

  RxBool isLunch = false.obs;

  @override
  void onInit() {
    super.onInit();
    setInitailTime();

    // 컨트롤러 생성 후 1분마다 반복
    timer = new Timer.periodic(Duration(seconds: 2), (timer) {
      currentTime = DateTime.now();
      hour.value = currentTime.hour; // 현재 시간 갱신
      min = currentTime.minute;
      if (min >= 55) {
        nextTime = 11;
      } else {
        nextTime = 0;
      }
      fetchHomeSchedule(trackCode, nextTime);
      getLunchTime();
      print('currentTime : ${currentTime}');
      print(
          'AuthService.to.user.value.trackCode : ${AuthService.to.user.value.trackCode}');
      print(
          'AuthService.to.user.value.regionCode : ${AuthService.to.user.value.regionCode}');
    });
    fetchTodayMenu(regionCode); // 오늘 메뉴 호출
    fetchHomeSchedule(trackCode, nextTime);
  }

  // 현재 시간표 요청
  Future fetchHomeSchedule(int trackCode, int nextTime) async {
    var res = await http.get(Uri.parse(
        "http://i8a602.p.ssafy.io:9090/schedule/now?track_code=${trackCode}&interval=${nextTime}"));
    var data = json.decode(res.body);

    if (res.statusCode != 200) {
      // api 오류 시
      nowSchedule = HomeSchedule(
          data: Data(title: '서버 오류', subTitle: '서버 점검 중 입니다.')); // 데이터 받기 실패시
    } else {
      nowSchedule = HomeSchedule.fromJson(data);
    }

    scheduleHour = nowSchedule.data!.startTime;
    scheduleHourEnd = nowSchedule.data!.endTime;
    totalTime = nowSchedule.data!.totalTime;

    isClassTime.value =
        (hour.value >= scheduleHour && hour.value < scheduleHourEnd)
            ? true
            : false;
    percent.value = getPercent(min);
    color.value = table[nowSchedule.data!.category]['color'];
    category.value = table[nowSchedule.data!.category]['category'];
    onoff.value = studyPlace[nowSchedule.data!.onOff];
    title.value = nowSchedule.data!.title;
    subTitle.value = nowSchedule.data!.subTitle;
    classTime.value = getClassTime(scheduleHour, scheduleHourEnd);
  }

  // 퍼센트 얻기
  double getPercent(int min) {
    if (isClassTime.value == false) {
      return 0.0;
    }

    int H = (hour.value - scheduleHour) * 60;
    return (H + min) / (totalTime * 60);
  }

  // 수업시간 스트링 뽑기
  String getClassTime(int startTime, int endTime) {
    String start = startTime < 10 ? '0${startTime}' : '${startTime}';
    String end = endTime < 10 ? '0${endTime}' : '${endTime}';
    return '${start}:00 ~ ${end}:00';
  }

  Future fetchTodayMenu(int regionCode) async {
    var res = await http.get(Uri.parse(
        'http://i8a602.p.ssafy.io:9090/menu/today?region=${regionCode}'));
    var data = json.decode(res.body);

    if (res.statusCode == 200) {
      todayMenu = HomeMenu.fromJson(data);
    } else {
      todayMenu = HomeMenu();
    }
  }

  Future setInitailTime() async {
    // currentTime = DateTime.now().add(Duration(hours: 9));
    currentTime = await DateTime.now();
    hour.value = currentTime.hour; // 현재 시간 갱신
    min = currentTime.minute;
    if (min >= 55) {
      nextTime = 11;
    } else {
      nextTime = 0;
    }
  }

  void getLunchTime() {
    int timer = hour.value * 100 + min;
    if (1130 <= timer && timer <= 1350) {
      isLunch.value = true;
    } else {
      isLunch.value = false;
    }
    print(isLunch);
  }
}
