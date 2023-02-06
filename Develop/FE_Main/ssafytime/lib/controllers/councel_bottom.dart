import 'package:get/get.dart';

// 상담신청 페이지 데이터 컨트롤러 들

// 상담자 선택 컨트롤러
class CBCouncelorController extends GetxController {
  // 동명 2인이 있을것을 고려해서 인덱스로 확인함
  RxInt myPick = 9999.obs;

  void select(int idx) {
    if (myPick.value == idx) {
      myPick.value = 9999;
    } else {
      myPick.value = idx;
    }
  }
}

// 날짜 선택 컨트롤러
class CBDatePickController extends GetxController{
  RxString myPick = ''.obs;
  RxString myDate = ''.obs;
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

// 시간 선택 컨트롤러
class CBTimeController extends GetxController {
  RxString myPick = ''.obs;

  void select(String time) {
    if (time == myPick.value) {
      myPick.value = ''; // 선택 상태에서 함더 누름 취소
    } else {
      myPick.value = time;
    }
  }
}

// 제목입렵 컨트롤러
class CBTitleController extends GetxController {
  RxString myInput = ''.obs;
}

// 카테고리 입력 컨트롤러
class CBCategoryController extends GetxController {
  RxString myInput = ''.obs;
}

