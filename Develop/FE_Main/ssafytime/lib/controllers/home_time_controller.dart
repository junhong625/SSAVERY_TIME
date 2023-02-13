import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTimeController extends GetxController{

  late var timer;


  @override
  void onInit() {
    super.onInit();
    print('홈타임 컨트롤로 생성!!!!!!!!!!!!!!!!!!!!');
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      print('하이하이');
      }
    );
  }



}