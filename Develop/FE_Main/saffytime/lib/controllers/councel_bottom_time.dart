import 'package:get/get.dart';

// 시간 선택 컨트롤러
class CBTimeController extends GetxController {
  RxString myPick = ''.obs;
  List reserved = <double>[].obs; // 이미 예약된 시간들

  void select(String time) {
    if (time == myPick.value) {
      myPick.value = ''; // 선택 상태에서 함더 누름 취소
    } else {
      myPick.value = time;
    }
  }
}