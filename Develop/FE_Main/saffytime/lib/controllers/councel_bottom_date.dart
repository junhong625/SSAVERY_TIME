import 'package:get/get.dart';

// 날짜 선택 컨트롤러
class CBDatePickController extends GetxController{
  RxString myPick = ''.obs;
  RxString myDate = ''.obs;

  // 달력 선택시
  void selectDate(List dateList) {
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
  }


}