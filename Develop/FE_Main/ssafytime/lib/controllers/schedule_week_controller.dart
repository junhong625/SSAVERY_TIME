import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/services/auth_service.dart';
import 'dart:convert';
import '../model/menu_week.dart';
import '../model/schedule_week.dart';

// 주간 시간표 컨트롤러 =============================================
class SchedulePickDayController extends GetxController {
  RxInt myPick = 9.obs; // 월 ~ 금
  List dayofweek = [0, 0, 0, 0, 0];
  DateTime today = DateTime.now().add(Duration(hours: 9));

  ScheduleWeek weekSchedule = ScheduleWeek();
  RxList<Datum> todaySchedule = <Datum>[].obs;
  List<Datum> nullSchedule = [Datum()];

  int? trackCode = AuthService.to.user.value.trackCode ?? 0;

  // var scheduleofweek = <List<Schedule>>[].obs;
  // var scheduleofday = <Schedule>[].obs;


  @override
  void onInit() async{
    super.onInit();

    await fetchScheduleWeek(trackCode);

    for (int i = 0; i < 5; i++) {
      DateTime tmp = today.subtract(Duration(days: today.weekday - (i + 1)));
      print('tmp.day : ${tmp.day}, today.day : ${today.day}');
      dayofweek[i] = tmp.day;
    }
    selectDay(0); // 주말의 경우 다음 월요일꺼 보여주기
    for (int i = 0; i < 5; i++) {
      if (today.day == dayofweek[i]) {
        myPick.value = i;
        selectDay(i);
      }
    }
  }



  Future fetchScheduleWeek(int? trackCode) async{
    if (trackCode == null) {
      weekSchedule = ScheduleWeek(
          data: {
            '0' : [Datum()],
            '1' : [Datum()],
            '2' : [Datum()],
            '3' : [Datum()],
            '4' : [Datum()],
          }
      );
      return ;
    }

    var res = await http.get(Uri.parse("http://i8a602.p.ssafy.io:9090/schedule/week?track_code=${trackCode}"));
    var data = json.decode(res.body);

    print(data["data"]);

    if (res.statusCode != 200) {
      weekSchedule = ScheduleWeek(
        data: {
          '0' : [Datum()],
          '1' : [Datum()],
          '2' : [Datum()],
          '3' : [Datum()],
          '4' : [Datum()],
        }
      );

    } else {
      weekSchedule = ScheduleWeek.fromJson(data);
    }
    print(weekSchedule.data);
  }

  void selectDay(int idx) {
    myPick.value = idx;

    print(weekSchedule.data);
    // today 갱신
    todaySchedule.clear();
    for (int i=0; i < weekSchedule.data!['${idx}']!.length; i++) {
      todaySchedule.add(weekSchedule.data!['${idx}']![i]);
    }
    print(todaySchedule);
  }
}