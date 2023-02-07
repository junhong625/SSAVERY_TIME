import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/menu_week.dart';
import '../model/schedule_week.dart';

// 주간 시간표 컨트롤러 =============================================
class SchedulePickDayController extends GetxController {
  RxInt myPick = 0.obs; // 월 ~ 금
  List dayofweek = [0, 0, 0, 0, 0];
  DateTime today = DateTime.now();
  var scheduleofweek = <List<Schedule>>[].obs;
  var scheduleofday = <Schedule>[].obs;


  @override
  void onInit() {
    super.onInit();
    initialRun();
  }


  void initialRun() async {

    // 이번주 시간표 가져오기 =======================
    // 트랙 번호 넣어서
    await requstMenuWeek(0);

    // 오늘 날짜 확인하기 ========================
    for (int i = 0; i < 5; i++) {
      DateTime tmp = today.subtract(Duration(days: today.weekday - (i + 1)));
      dayofweek[i] == tmp.day;
    }
    selectDay(0); // 주말의 경우 다음 월요일꺼 보여주기
    for (int i = 0; i < 5; i++) {
      if (today.day == dayofweek[i]) {
        myPick.value == i;
        selectDay(i);
      }
    }
  }

  Future requstMenuWeek(int trackCode) async{
    scheduleofweek = <List<Schedule>>[].obs; // 일주일 시간표
    var res = await http.get(Uri.parse("http://i8a602.p.ssafy.io:9090/schedule/week?track_code=${trackCode}"));
    var data = json.decode(res.body);

    final List dataList = data['data'].values.map((x) => x).toList();

    for (int i=0; i < dataList.length; i++) {
      List<Schedule> schedule = []; // 하루 시간표
      for (int j=0; j < dataList[i].length; j++) {
        schedule.add(
            Schedule(
              date: dataList[i][j]["date"],
              startTime: dataList[i][j]["startTime"],
              endTime: dataList[i][j]["endTime"],
              onOff: dataList[i][j]["onOff"],
              title: dataList[i][j]["title"],
              subTitle: dataList[i][j]["subTitle"],
              category: dataList[i][j]["category"],
              totalTime: dataList[i][j]["totalTime"],
            )
        );
      }
      scheduleofweek.add(schedule);
    };
    return ;
  }

  void selectDay(int idx) {
    myPick.value = idx;
    // requstMenuWeek(0);
    scheduleofday = scheduleofweek[idx].obs;

  }
}