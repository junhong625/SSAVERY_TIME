import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ssafytime/controllers/councel_bottom_time.dart';
import 'dart:convert';
import 'councel_bottom_councelor.dart';

// 날짜 선택 컨트롤러
class CBDatePickController extends GetxController{
  RxString myPick = ''.obs;
  RxString myDate = ''.obs;

  // 달력 선택시에 반영하고 관리자 + 날짜로 예약 현황 API 호출한다.
  void selectDate(List dateList) async {
    const Map<String, String> Eformat = {
      'Sun' : '일',
      'Mon' : '월',
      'Tue' : '화',
      'Wed' : '수',
      'Thu' : '목',
      'Fri' : '금',
      'Sat' : '토',
    };
    var EE = Eformat[dateList[3]]; // 요일
    myDate.value = '${dateList[0]}년 ${dateList[1]}월 ${dateList[2]}일 (${EE})';
    myPick.value = '${dateList[0]}-${dateList[1]}-${dateList[2]}';

    int managerId = Get.find<CBCouncelorController>().myPick.value; // 내가 선택한 관리자 아이디
    String date = myPick.value; // 내가 선택한 날짜
    print(managerId);
    print(date);

    // 842167, 2022-10-12
    var res = await http.get(Uri.parse("http://i8a602.p.ssafy.io:9090/reserve/time?date=${date}&managerId=${managerId}"));
    var data = json.decode(res.body);

    print(data); //{time: [13.5]}
    // 시간 선택 컨트롤러는 미리 생성해 놓았다.
    Get.find<CBTimeController>().reserved = data['time']; // 예약된시간들을 넣어 놓는다.






  }

}