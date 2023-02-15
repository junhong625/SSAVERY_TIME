import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ssafytime/controllers/councel_controller.dart';

import '../custom_button.dart';
import 'councel_bottom_counselor_total.dart';
import 'councel_bottom_input_category.dart';
import 'councel_bottom_date.dart';
import 'councel_bottom_input_title.dart';
import 'councel_bottom_time_total.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



void openCouncelBottomSheet(BuildContext context) {
    MyCouncelController controller = Get.find<MyCouncelController>();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0)
          )
        ),
        builder: (BuildContext context) {
        return Obx(() => GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0)
              ),
              padding: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text('상담신청', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                      ),
                      CBCouncelorTotal(),

                      // 관리자가 선택 되어야 낳짜를 선택할 수 있다.
                      controller.myPickCouncelor.value != 0 ?
                      CBDate() : SizedBox(), // 날짜 선택

                      // 날짜가 선택되어야 시간을 선택할 수 있다.
                      (controller.myPickDateDisplay.value != '') ?
                      CBTimeTotal() : SizedBox(), // 시간 선택

                      // 시간을 선택하고 나면 제목과 카테고리를 입력할 수 있다.
                      (controller.myPickTime.value != '') ?
                      CBInputTitle() : SizedBox(), // 내용 입력
                      (controller.myPickTime.value != '') ?
                      CBCategoryTotal() : SizedBox(), // 카테고리 입력

                      Container(
                        color: Colors.lime,
                        // width: 390,
                        width: MediaQuery.of(context).size.width * ( 390 / 392.7),
                        height: 47,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              // width: 171,
                              width: MediaQuery.of(context).size.width * ( 171 / 392.7),
                              height: 40,
                              label: '닫기',
                            ),
                            if (controller.myInputTitle.value != '' && controller.myInputCategory.value != '')
                              CustomElevatedButton(
                                onPressed: () {
                                  controller.submitCouncelApplication();
                                  Get.back();
                                },
                                color: 0xff3094F2,
                                width: 171, height: 40,
                                label: '제출',
                                labelColor: 0xffFFFFFF,
                              ),
                            if (controller.myInputTitle.value == '' || controller.myInputCategory.value == '')
                              CustomElevatedButton(
                                onPressed: () {
                                  print('제출 내용 부족');
                                },
                                color: 0xffD9D9D9,
                                // width: 171,
                                width: MediaQuery.of(context).size.width * ( 171 / 392.7),
                                height: 40,
                                label: '제출',
                                labelColor: 0xffFFFFFF,
                              ),
                          ],
                        ),

                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    ).whenComplete(() => resetApplyData());
}

void resetApplyData() {
  MyCouncelController controller = Get.find<MyCouncelController>();
  controller.myPickCouncelor.value = 0;
  controller.myPickDateDisplay.value = '';
  controller.myPickDateServe.value = '';
  controller.myPickTime.value = '';
  controller.myInputTitle.value = '';
  controller.myInputCategory.value = '';
}

// 상담 신청 제출
// void submitCouncelApplication() async {
//   MyCouncelController controller = Get.find<MyCouncelController>();
//   int studentId = 3241114; // 유저 정보 컨트롤러 생기면 가져오면 됨
//   int managerId = controller.myPickCouncelor.value;
//   String rezDate = controller.myPickDateServe.value;
//   String rezTime = controller.myPickTime.value;
//   String title = controller.myInputTitle.value;
//   String category = controller.myInputCategory.value;
//
//   var body = json.encode({
//     "studentId" : studentId,
//     "managerId" : managerId,
//     "rezDate" : rezDate,
//     "rezTime" : rezTime,
//     "title" : title,
//     "category" : category,
//   });
//
//   var headers = {"Content-Type": "application/json"};
//
//   print(body.runtimeType);
//   print(managerId);
//
//   // post 가 안되는데 어떻게 함
//   var res = await http.post(Uri.parse('http://i8a602.p.ssafy.io:9090/reserve/submit'), headers: headers, body: body);
//   print(res.statusCode);
//
//   await controller.fetchMyCouncelList(842167, 1);
// }