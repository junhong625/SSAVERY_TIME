import 'package:get/get.dart';

class PickDayController extends GetxController {
  var myPick = [].obs; // 월 ~ 금
  var  dayofweek = [0, 0, 0, 0, 0].obs;
  DateTime today = DateTime.now();
  var ccc = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initialRun();
  }


  void initialRun() {
    for (int i = 0; i < 5; i++) {
      DateTime tmp = today.subtract(Duration(days: today.weekday - (i+1)));
      dayofweek[i] = tmp.day;
    }
    myPick = [].obs; // 초기화
    for (int i = 0; i < 5; i++) {
      if (today.day == dayofweek[i]) {
        myPick.add(i);
      }
    }
    ccc ++;
  }

  void selectDay(int idx) {
    myPick = [].obs; // 초기화
    myPick.add(idx);
    print(myPick);
    ccc ++;
  }
}
