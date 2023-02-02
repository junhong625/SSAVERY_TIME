import 'package:get/get.dart';

class PickDayController extends GetxController {
  // var myPick = 0.obs; // 월 ~ 금
  final RxList<int> myPick = <int>[].obs;
  var dayofweek = [0, 0, 0, 0, 0].obs;
  DateTime today = DateTime.now();
  final RxInt ccc = 0.obs;
  // List<SurveyItem> list = [].obs;

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
    // myPick = 0.obs; // 초기화
    // myPick = [].obs; // 초기화
    // for (int i = 0; i < 5; i++) {
    //   if (today.day == dayofweek[i]) {
    //     // myPick.add(i);
    //     myPick = [i.obs].obs;
    //
    //     // myPick.value = i;
    //
    //   }
    // }
    // ccc ++;
  }

  void setSurveyItem(){

  }
  void selectDay(int idx) {
    // myPick = [idx.obs].obs;
    // // myPick = [].obs; // 초기화
    // // myPick.add(idx);
    // // myPick.value = idx;
    // var tmp = [idx.obs].obs;
    // myPick = tmp;
    // print(myPick.contains(idx));

    // ccc ++;
    
  }

  void addItem(){
    myPick.add(ccc.value);
  }
  void changeItem(){
    myPick[0] = ccc.value += 1;
  }
}

class SurveyItem{

}

class SurveyResult{
  String? itemNum;
  int? itemSelected;
}
