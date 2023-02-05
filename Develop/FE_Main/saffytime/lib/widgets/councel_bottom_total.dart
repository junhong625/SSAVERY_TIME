import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/councel_bottom.dart';
import '../custom_button.dart';
import '../model/councel_bottom.dart';
import 'councel_bottom_ counselor_item.dart';
import 'councel_bottom_counselor_total.dart';
import 'councel_bottom_input_category.dart';
import 'councel_bottom_date.dart';
import 'councel_bottom_input_title.dart';
import 'councel_bottom_time_total.dart';


void openCouncelBottomSheet(BuildContext context) {
  // Get.bottomSheet(
    // isScrollControlled: true,
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0)
          )
        ),
        builder: (BuildContext context) {
        return GestureDetector(
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
                    CBDate(), // 날짜 선택
                    CBTimeTotal(), // 시간 선택
                    CBInputTitle(), // 내용 입력
                    CBCategoryTotal(), // 카테고리 입력
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
                          CustomElevatedButton(
                            onPressed: () {
                              submitCouncelApplication();
                            },
                            color: 0xff3094F2,
                            width: 171, height: 40,
                            label: '제출',
                            labelColor: 0xffFFFFFF,
                          )
                        ],
                      ),

                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  // );
}


// 상담 신청 제출
void submitCouncelApplication() {
  int studentId = 3241114; // 유저 정보 컨트롤러 생기면 가져오면 됨
  int managerId = Get.find<CBCouncelorController>().myPick.value;
  String rezDate = Get.find<CBDatePickController>().myPick.value;
  String rezTime = Get.find<CBTimeController>().myPick.value;
  String title = Get.find<CBTitleController>().myInput.value;
  String category = Get.find<CBCategoryController>().myInput.value;

  CouncelApplication data = CouncelApplication(
    studentId: studentId,
    managerId: managerId,
    rezDate: rezDate,
    rezTime: rezTime,
    title: title,
    category: category,
  );

  String jsonData = councelApplicationToJson(data);
  print(jsonData);

  // 서버로 jsonData 보내는 기능 구현 필요

}