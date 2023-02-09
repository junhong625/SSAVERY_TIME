import 'package:flutter/material.dart';
import 'package:ssafytime/custom_button.dart';
import 'package:get/get.dart' ;
import 'package:ssafytime/widgets/councel_list_admin_item.dart';

import '../controllers/councel_controller.dart';
import 'councel_list_item.dart';

// 관리자에게 온 상담 신청 현황 전체 위젯

class CAdminCouncel extends StatelessWidget {

  CAdminCouncel({Key? key}) : super(key: key);

  MyCouncelController controller = Get.put(MyCouncelController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      color: Colors.yellowAccent,
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      width: 390, height: 666,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomElevatedButton(
                label: '생성admin',
                onPressed: () async {
                }
            ),
            CustomElevatedButton(
                label: '삭제admin',
                onPressed: () async {
                }
            ),
            CustomElevatedButton(
                label: '조회admin',
                onPressed: () async {
                }
            ),
            CustomElevatedButton(
                label: '이동admin',
                onPressed: () {
                  Get.toNamed('/TestPage');
                }
            ),
            Text('${controller.myCouncelList.length}'),
            for (int i=0; i < controller.myCouncelList.length; i++) ... [
              CouncelAdminListItem(
                data: controller.myCouncelList[i],
                currentTime: controller.doubleTypeCurrentTime.value,
                startTime: controller.myCouncelStartTimeList[i],
                endTime: controller.myCouncelEndTimeList[i],
              ),
              Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),
            ],

          ],
        ),
      ),
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
