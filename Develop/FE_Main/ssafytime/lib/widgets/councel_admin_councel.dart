import 'package:flutter/material.dart';
import 'package:ssafytime/controllers/user_state_controller.dart';
import 'package:ssafytime/custom_button.dart';
import 'package:get/get.dart' ;
import 'package:ssafytime/services/auth_service.dart';
import 'package:ssafytime/widgets/councel_list_admin_item.dart';
import 'package:ssafytime/widgets/custom_text.dart';

import '../controllers/councel_controller.dart';
import 'councel_list_item.dart';

// 관리자에게 온 상담 신청 현황 전체 위젯

class CAdminCouncel extends StatelessWidget {

  CAdminCouncel({Key? key}) : super(key: key);

  MyCouncelController controller = Get.put(MyCouncelController());
  UserStateController testcontroller = Get.put(UserStateController());


  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        width: 390, height: 666,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    CustomText(content: '상담 승인 목록', fontSize: 25,),
                    Divider(thickness: 1, height: 1, color: Color(0xffC3C6CF),),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 300,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i=0; i < controller.myCouncelList.length; i++) ... [
                              if (controller.myCouncelList[i].value.state == 2)
                              Container(
                                child: CouncelAdminListItem(
                                  data: controller.myCouncelList[i],
                                  currentTime: controller.doubleTypeCurrentTime.value,
                                  startTime: controller.myCouncelStartTimeList[i],
                                  endTime: controller.myCouncelEndTimeList[i],
                                ),
                                margin: EdgeInsets.only(bottom: 5),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),


                  // 나에게(관리자)에게 온 신청 목록 ========================================
                    CustomText(content: '상담 신청 목록', fontSize: 25,),
                    Divider(thickness: 1, height: 1, color: Color(0xffC3C6CF),),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 300,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i=0; i < controller.myCouncelList.length; i++) ... [
                              if (controller.myCouncelList[i].value.state == 1)
                                Container(
                                  child: CouncelAdminListItem(
                                    data: controller.myCouncelList[i],
                                    currentTime: controller.doubleTypeCurrentTime.value,
                                    startTime: controller.myCouncelStartTimeList[i],
                                    endTime: controller.myCouncelEndTimeList[i],
                                  ),
                                  margin: EdgeInsets.only(bottom: 5),
                                ),
                            ],
                          ],
                        ),
                      ),
                    ),

                    // 거절한 상담 신청 목록 ====================================================
                    CustomText(content: '상담 거절 목록', fontSize: 25,),
                    Divider(thickness: 1, height: 1, color: Color(0xffC3C6CF),),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 300,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i=0; i < controller.myCouncelList.length; i++) ... [
                              if (controller.myCouncelList[i].value.state == 3)
                                Container(
                                  child: CouncelAdminListItem(
                                    data: controller.myCouncelList[i],
                                    currentTime: controller.doubleTypeCurrentTime.value,
                                    startTime: controller.myCouncelStartTimeList[i],
                                    endTime: controller.myCouncelEndTimeList[i],
                                  ),
                                  margin: EdgeInsets.only(bottom: 5),
                                ),
                            ],
                          ],
                        ),
                      ),
                    ),

                    // 종료된 상담 목록 =============================================================
                    CustomText(content: '상담 종료 목록', fontSize: 25,),
                    Divider(thickness: 1, height: 1, color: Color(0xffC3C6CF),),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 300,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i=0; i < controller.myCouncelList.length; i++) ... [
                              if (controller.myCouncelList[i].value.state == 4)
                                Container(
                                  child: CouncelAdminListItem(
                                    data: controller.myCouncelList[i],
                                    currentTime: controller.doubleTypeCurrentTime.value,
                                    startTime: controller.myCouncelStartTimeList[i],
                                    endTime: controller.myCouncelEndTimeList[i],
                                  ),
                                  margin: EdgeInsets.only(bottom: 5),
                                ),
                            ],
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              )
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
