import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pjt/widgets/councel_bottom_date.dart';

import 'councel_bottom_ counselor.dart';
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
        ],
      ),
    ),
  );
}