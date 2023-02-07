import 'package:flutter/material.dart';
import 'package:ssafytime/custom_button.dart';
import 'package:get/get.dart';
import '../controllers/councel_bottom_councelor.dart';
import '../controllers/councel_bottom_date.dart';
import '../controllers/councel_bottom_text.dart';
import '../controllers/councel_bottom_time.dart';
import 'councel_list_item.dart';
import '../controllers/councel_my.dart';


class CMyCouncel extends StatelessWidget {

  CMyCouncel({Key? key}) : super(key: key);

  MyCouncelController controller = Get.put(MyCouncelController());

  // 날짜 선택 제목 카테고리 컨트롤러는 당장은 안쓰는데 여기서 만들어 줘야함 -> 바텀시트에서 find 로 불러와야할 떄가 있어서
  CBCouncelorController tmpcontroller5 = Get.put(CBCouncelorController());
  CBDatePickController tmpcontroller = Get.put(CBDatePickController());
  CBTimeController tmpcontroller2 = Get.put(CBTimeController());
  CBTitleController tmpcontroller3 = Get.put(CBTitleController());
  CBCategoryController tmpcontroller4 = Get.put(CBCategoryController());



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      width: 390, height: 666,
      child: Column(
        children: [
          CustomElevatedButton(
              onPressed: () async {
                controller.requestMyCouncel(20168125, 0);
              }
          ),
          for (int i=0; i < controller.myCouncelList.length; i++) ... [
            CouncelListItem(
              startTime: controller.startTime[i],
              endTime: controller.endTime[i],
              rezTime: controller.myCouncelList.value[i].rezTime,
              currentTime: controller.doubleTypeCurrentTime.value,
              title: controller.myCouncelList[i].title,
            ),
            Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),
          ]
        ],
      ),
    );
  }
}

//
// 현재 시간, 년 월 일 시 분 을 숫자로 변환
double calculatorTime(DateTime time) {
  String s = '';
  String t = '';
  s = time.year.toString() + time.month.toString() + time.day.toString();
  t = (time.hour.toInt() + (time.minute.toInt()/60)).toStringAsFixed(2).toString();
  double v = double.parse((s+t));
  return v;
}
