import 'package:flutter/material.dart';
import 'package:ssafytime/custom_button.dart';
import 'package:get/get.dart';

import '../controllers/councel_controller.dart';
import 'councel_list_item.dart';



class CMyCouncel extends StatelessWidget {

  CMyCouncel({Key? key}) : super(key: key);

  MyCouncelController controller = Get.put(MyCouncelController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        color: Colors.yellowAccent,
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        width: 390, height: 666,
        child: Column(
          children: [
            CustomElevatedButton(
              label: '생성',
              onPressed: () async {
                await controller.fetchMyCouncelList(20168125, 0);
                // await controller.fetchCouncelor(1,1);
              }
            ),
            CustomElevatedButton(
              label: '삭제',
                onPressed: () async {
                  controller.myCouncelList.clear();
                  print(controller.myCouncelList);
                }
            ),
            CustomElevatedButton(
                label: '조회',
                onPressed: () async {
                  print('myCouncelList : ${controller.myCouncelList}');
                  print('councelorList : ${controller.councelorList}');
                  // print('controller.myCouncelList.length : ${controller.myCouncelList.length}');
                }
            ),
            CustomElevatedButton(
              label: '이동',
              onPressed: () {
                Get.toNamed('/TestPage');
              }
            ),
            for (int i=0; i < controller.myCouncelList.length; i++) ... [
              CouncelListItem(
                startTime: controller.myCouncelStartTimeList[i],
                endTime: controller.myCouncelEndTimeList[i],
                rezTime: controller.myCouncelList[i].rezTime,
                currentTime: controller.doubleTypeCurrentTime.value,
                title: controller.myCouncelList[i].title,
                reject : controller.myCouncelList[i].reject,
              ),
              Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),
            ]
          ],
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
