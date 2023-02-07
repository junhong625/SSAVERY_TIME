import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ntp/ntp.dart';
import 'dart:convert';
import '../model/councel_detail.dart';

class MyCouncelController extends GetxController {
  var myCouncelList = <CouncelDetail>[].obs;
  // Rxn<DateTime> currentTime = Rxn<DateTime>();
  Rx<DateTime> currentTime = DateTime.now().obs;
  var doubleTypeCurrentTime = 1.0.obs; // 현재 시간은 더블 타입으로 바꾼것
  List<double> startTime = [];
  List<double> endTime = [];



  @override
  void onInit() {
    super.onInit();
    initialRun();
  }

  void initialRun() async {
    currentTime.value = DateTime.now().add(Duration(hours: 9));
    calculatorTime(currentTime.value!);
    await requestMyCouncel(20168125, 0); // 더미 데이터
  }

  // 내 상담신청 현황 요청청
  // userId : 학번, code : 학생, 관리자 구분 코드
  Future requestMyCouncel(int userId, int code) async {
    await setNowTime();
    myCouncelList = <CouncelDetail>[].obs;
    startTime = <double>[];
    var res = await http.get(Uri.parse("http://i8a602.p.ssafy.io:9090/meet/${userId}/${code}"));
    var data = json.decode(res.body);

    for (int i=0; i < data.length; i++) {
      myCouncelList.add(
          CouncelDetail(
            rezDate: DateTime.parse(data[i]["rezDate"]),
            rezTime: data[i]["rezTime"]?.toDouble(),
            title: data[i]["title"],
            category: data[i]["category"],
            meetUrl: data[i]["meetUrl"],
            rezIdx: data[i]["rezIdx"],
            reject: data[i]["reject"],
            state: data[i]["state"],
            name: data[i]["name"],
          )
      );
      startTime.add(
          calculatorTimeOfClass(myCouncelList[i].rezDate, myCouncelList[i].rezTime)
      );
      endTime.add(
        startTime[i] + 100
      );

    }
    return ;
  }

  // 시간 재 설정
  Future setNowTime() async {
    print('!!!!!');
    // currentTime.value = await NTP.now();
    currentTime = DateTime.now().add(Duration(hours: 9)).obs;
    calculatorTime(currentTime.value!);
    return ;
  }

  // DateTime 형태 (CouncelDetail 클래스 는 변환 안됨)
  // 현재 시간, 년 월 일 시 분 을 숫자로 변환
  void calculatorTime(DateTime time) {
    String year = time.year.toString();
    String mon = time.month.toString();
    String day = time.day.toString();
    mon.length == 1 ? mon = '0'+mon : null;
    day.length == 1 ? day = '0'+day : null;
    String s = year+mon+day;

    String hour = time.hour.toString();
    String min = time.minute.toString();
    hour.length == 1 ? hour = '0'+hour : null;
    min.length == 1 ? min = '0'+min : null;
    String t = hour + min;

    double v = double.parse((s+t));
    doubleTypeCurrentTime.value = v;
  }

  // CouncelDetail 클래스의 시간을 변환
  double calculatorTimeOfClass(DateTime rezDate, double rezTime) {
    String year = rezDate.year.toString();
    String mon = rezDate.month.toString();
    String day = rezDate.day.toString();
    mon.length == 1 ? mon = '0'+mon : null;
    day.length == 1 ? day = '0'+day : null;
    String s = year+mon+day;
    double v = double.parse(s);


    // 13.0 -> 1300 으로 , 14.5 -> 1430 으로
    double a = rezTime;
    double b = a%1;
    a -= b;
    double c = b*60;
    double d = a*100 + c;

    return v*10000 + d;
  }


}