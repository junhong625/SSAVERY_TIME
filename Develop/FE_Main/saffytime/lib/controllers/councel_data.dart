import 'package:get/get.dart';

// 상담신청 페이지 데이터 컨트롤러 들

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