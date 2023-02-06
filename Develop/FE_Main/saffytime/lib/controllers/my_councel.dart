import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntp/ntp.dart';
import 'package:saffytime/custom_button.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:saffytime/widgets/notification_infomation.dart';
import 'dart:convert';

import '../model/councel_detail.dart';
import '../widgets/councel_list_item.dart';
import 'councel_my.dart';


class CMyCouncel extends StatelessWidget {

  CMyCouncel({Key? key}) : super(key: key);

  MyCouncelController controller = Get.put(MyCouncelController());

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
                // DateTime currentTime = await NTP.now();
                // print(DateTime.now().add(Duration(hours: 9)));
                print('시간 : ${DateTime.now().add(Duration(hours: -13))}');
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
