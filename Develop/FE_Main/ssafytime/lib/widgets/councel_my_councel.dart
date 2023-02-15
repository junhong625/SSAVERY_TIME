import 'package:flutter/material.dart';
import 'package:ssafytime/controllers/user_controller.dart';
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
        color: Colors.white,
        // color: Colors.black26,
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        // width: 390,
      width: MediaQuery.of(context).size.width * ( 390 / 392.7),
      // height: 666,
      height: MediaQuery.of(context).size.height * ( 666 / 803),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.fetchMyCouncelList();
            print(MediaQuery.of(context).size.width);
          },
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),

              for (int i=0; i < controller.myCouncelList.length; i++) ... [
                CouncelListItem(
                  startTime: controller.myCouncelStartTimeList[i],
                  endTime: controller.myCouncelEndTimeList[i],
                  rezTime: controller.myCouncelList[i].value.rezTime,
                  currentTime: controller.doubleTypeCurrentTime.value,
                  title: controller.myCouncelList[i].value.title,
                  reject : controller.myCouncelList[i].value.reject,
                  state: controller.myCouncelList[i].value.state,
                  sessionId : controller.myCouncelList[i].value.sessionId,
                ),
                Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),
              ],


              // // 진행 중인 상담 ==============================================
              // for (int i=0; i < controller.myCouncelList.length; i++) ... [
              //   if (controller.myCouncelStartTimeList[i] <= controller.doubleTypeCurrentTime.value &&
              //       controller.doubleTypeCurrentTime.value <= controller.myCouncelEndTimeList[i]) ... [
              //   InkWell(
              //     onTap: () {
              //       print('히히');
              //     },
              //     child: CouncelListItem(
              //       startTime: controller.myCouncelStartTimeList[i],
              //       endTime: controller.myCouncelEndTimeList[i],
              //       rezTime: controller.myCouncelList[i].value.rezTime,
              //       currentTime: controller.doubleTypeCurrentTime.value,
              //       title: controller.myCouncelList[i].value.title,
              //       reject : controller.myCouncelList[i].value.reject,
              //       state: controller.myCouncelList[i].value.state,
              //       sessionId : controller.myCouncelList[i].value.sessionId,
              //     ),
              //   ),
              //   Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),
              //   ]
              // ],

              // 승인된 상담 ============================================== state == 2 인 것중에 진행중이 아닌거
              // for (int i=0; i < controller.myCouncelList.length; i++) ... [
              //   if (controller.myCouncelList[i].value.state == 2 &&
              //   !(controller.myCouncelStartTimeList[i] <= controller.doubleTypeCurrentTime.value &&
              //       controller.doubleTypeCurrentTime.value <= controller.myCouncelEndTimeList[i])) ... [
              //     InkWell(
              //       onTap: () {
              //         // 테스트용 이 기능 진행중인 상담에다가 써야함.
              //         showDialog(
              //           context: context,
              //           barrierDismissible: false,
              //           builder: (BuildContext context) {
              //             return AlertDialog(
              //               title: Text('거절 사유를 입력해주세요.'),
              //               content: SizedBox(),
              //               actions: [
              //                 CustomElevatedButton(
              //                   label: '제출',
              //                   // width: 100,
              //                   width: MediaQuery.of(context).size.width * ( 100 / 392.7),
              //                   // height: 40,
              //                     height: MediaQuery.of(context).size.height * ( 40 / 803),
              //                   onPressed: () {
              //                     print('이동');
              //                     }
              //                   ),
              //                 CustomElevatedButton(
              //                   label: '닫기',
              //                   // width: 100,
              //                     width: MediaQuery.of(context).size.width * ( 100 / 392.7),
              //                     // height: 40,
              //                     height: MediaQuery.of(context).size.height * ( 40 / 803),
              //                   onPressed: () {
              //                     print('닫기');
              //                   }
              //                 )
              //               ],
              //               actionsAlignment: MainAxisAlignment.spaceAround
              //             );
              //           }
              //         );
              //       },
              //       child: CouncelListItem(
              //         startTime: controller.myCouncelStartTimeList[i],
              //         endTime: controller.myCouncelEndTimeList[i],
              //         rezTime: controller.myCouncelList[i].value.rezTime,
              //         currentTime: controller.doubleTypeCurrentTime.value,
              //         title: controller.myCouncelList[i].value.title,
              //         reject : controller.myCouncelList[i].value.reject,
              //         state: controller.myCouncelList[i].value.state,
              //         sessionId : controller.myCouncelList[i].value.sessionId,
              //       ),
              //     ),
              //     Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),
              //   ]
              // ],
              //
              // // 승인 대기중인 상담 ==============================================
              // for (int i=0; i < controller.myCouncelList.length; i++) ... [
              //   if (controller.myCouncelList[i].value.state == 1) ... [
              //     CouncelListItem(
              //       startTime: controller.myCouncelStartTimeList[i],
              //       endTime: controller.myCouncelEndTimeList[i],
              //       rezTime: controller.myCouncelList[i].value.rezTime,
              //       currentTime: controller.doubleTypeCurrentTime.value,
              //       title: controller.myCouncelList[i].value.title,
              //       reject : controller.myCouncelList[i].value.reject,
              //       state: controller.myCouncelList[i].value.state,
              //       sessionId : controller.myCouncelList[i].value.sessionId,
              //     ),
              //     Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),
              //   ]
              // ],
              //
              // // 종료 or 거절 된 상담 ==============================================
              // for (int i=0; i < controller.myCouncelList.length; i++) ... [
              //   if (controller.myCouncelList[i].value.state == 3 ||
              //       controller.myCouncelList[i].value.state == 4) ... [
              //     CouncelListItem(
              //       startTime: controller.myCouncelStartTimeList[i],
              //       endTime: controller.myCouncelEndTimeList[i],
              //       rezTime: controller.myCouncelList[i].value.rezTime,
              //       currentTime: controller.doubleTypeCurrentTime.value,
              //       title: controller.myCouncelList[i].value.title,
              //       reject : controller.myCouncelList[i].value.reject,
              //       state: controller.myCouncelList[i].value.state,
              //       sessionId : controller.myCouncelList[i].value.sessionId,
              //     ),
              //     Divider(thickness: 2, height: 6, color: Color(0xffC3C6CF),),
              //   ]
              // ],


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
