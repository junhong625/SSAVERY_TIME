import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/councel_bottom_date.dart';
import 'package:ssafytime/controllers/councel_bottom_time.dart';

import '../controllers/councel_bottom_councelor.dart';
import '../controllers/councel_bottom_text.dart';
import '../custom_button.dart';
import 'councel_bottom_counselor_total.dart';
import 'councel_bottom_input_category.dart';
import 'councel_bottom_date.dart';
import 'councel_bottom_input_title.dart';
import 'councel_bottom_time_total.dart';
import 'package:http/http.dart' as http;


void openCouncelBottomSheet(BuildContext context) {
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
                      Get.find<CBCouncelorController>().myPick.value != 0 ?
                      CBDate() : SizedBox(), // 날짜 선택

                      // 날짜가 선택되어야 시간을 선택할 수 있다.
                      (Get.find<CBDatePickController>().myPick.value != '') ?
                      CBTimeTotal() : SizedBox(), // 시간 선택

                      // 시간을 선택하고 나면 제목과 카테고리를 입력할 수 있다.
                      (Get.find<CBTimeController>().myPick.value != '') ?
                      CBInputTitle() : SizedBox(), // 내용 입력
                      (Get.find<CBTimeController>().myPick.value != '') ?
                      CBCategoryTotal() : SizedBox(), // 카테고리 입력

                      Container(
                        color: Colors.lime,
                        width: 390, height: 47,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              width: 171, height: 40,
                              label: '닫기',
                            ),
                            if (Get.find<CBTitleController>().myInput.value != '' && Get.find<CBCategoryController>().myInput.value != '')
                              CustomElevatedButton(
                                onPressed: () {
                                  submitCouncelApplication();
                                },
                                color: 0xff3094F2,
                                width: 171, height: 40,
                                label: '제출',
                                labelColor: 0xffFFFFFF,
                              ),
                            if (Get.find<CBTitleController>().myInput.value == '' || Get.find<CBCategoryController>().myInput.value == '')
                              CustomElevatedButton(
                                onPressed: () {
                                },
                                color: 0xffD9D9D9,
                                width: 171, height: 40,
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
  Get.find<CBCouncelorController>().myPick.value = 0;
  Get.find<CBDatePickController>().myDate.value = '';
  Get.find<CBDatePickController>().myPick.value = '';
  Get.find<CBTimeController>().myPick.value = '';
  Get.find<CBTitleController>().myInput.value = '';
  Get.find<CBCategoryController>().myInput.value = '';
}

// 상담 신청 제출
void submitCouncelApplication() async {
  int studentId = 3241114; // 유저 정보 컨트롤러 생기면 가져오면 됨
  int managerId = Get.find<CBCouncelorController>().myPick.value;
  String rezDate = Get.find<CBDatePickController>().myPick.value;
  String rezTime = Get.find<CBTimeController>().myPick.value;
  String title = Get.find<CBTitleController>().myInput.value;
  String category = Get.find<CBCategoryController>().myInput.value;

  print(studentId);
  print(managerId);
  print(rezDate);
  print(rezTime);
  print(title);
  print(category);

  var body = {
    studentId : studentId,
    managerId : managerId,
    rezDate : rezDate,
    rezTime : rezTime,
    title : title,
    category : category,
  };

  var res = await http.post(Uri.parse('http://i8a602.p.ssafy.io:9090/reserve/submit'), body: body);

  print(res.statusCode);

  // 서버로 jsonData 보내는 기능 구현 필요

}