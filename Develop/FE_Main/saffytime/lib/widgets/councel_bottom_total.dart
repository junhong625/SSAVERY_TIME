import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/councel_bottom.dart';
import '../custom_button.dart';
import 'councel_bottom_ counselor.dart';
import 'councel_bottom_category_total.dart';
import 'councel_bottom_date.dart';
import 'councel_bottom_input_title.dart';
import 'councel_bottom_time_total.dart';


void openCouncelBottomSheet() {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Text('상담신청1', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
          ),
          Container(
            color: Colors.cyanAccent,
            width: 390,height: 92,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CBCounselor()
              ],
            ),
          ),
          CBDate(), // 날짜 선택
          CBTimeTotal(), // 시간 선택
          CBInputTitle(), // 내용 입력
          CBCategoryTotal(), // 카테고리 선택
          Container(
            color: Colors.lime,
            width: 390, height: 47,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    tmp();
                  },
                  child: Text('dd')
                )

              ],
            ),

          )
        ],
      ),
    ),
  );
}

void tmp() {
  CBTimeController a = Get.put(CBTimeController());
  CBCategoryController b = Get.put(CBCategoryController());

  print([a.myPick.value, b.myPick]);
}