// To parse this JSON data, do
//
//     final weekSchedule = weekScheduleFromJson(jsonString);
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/menu_week.dart';

Map<String, List<Schedule>> scheduleFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Schedule>>(k, List<Schedule>.from(v.map((x) => Schedule.fromJson(x)))));

String scheduleToJson(Map<String, List<Schedule>> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))));

class Schedule {
  Schedule({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.onOff,
    required this.title,
    required this.subTitle,
    required this.category,
    required this.totalTime,
  });

  int date;
  int startTime;
  int endTime;
  int onOff;
  String title;
  String subTitle;
  int category;
  int totalTime;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    date: json["date"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    onOff: json["onOff"],
    title: json["title"],
    subTitle: json["subTitle"],
    category: json["category"],
    totalTime: json["totalTime"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "startTime": startTime,
    "endTime": endTime,
    "onOff": onOff,
    "title": title,
    "subTitle": subTitle,
    "category": category,
    "totalTime": totalTime,
  };
}


void testschedule(int trackCode) async {

  var res = await http.get(Uri.parse("http://i8a602.p.ssafy.io:9090/schedule/week?track_code=${trackCode}"));
  var data = json.decode(res.body);

  final List dataList = data['data'].values.map((x) => x).toList();

  List weekofschedule = [];
  for (int i=0; i < dataList.length; i++) {
    List dayofschedule = [];
    for (int j=0; j < dataList[i].length; j++) {
      dayofschedule.add(
          Schedule(
            date: dataList[i][j]["date"],
            startTime: dataList[i][j]["startTime"],
            endTime: dataList[i][j]["endTime"],
            onOff: dataList[i][j]["onOff"],
            title: dataList[i][j]["title"],
            subTitle: dataList[i][j]["subTitle"],
            category: dataList[i][j]["category"],
            totalTime: dataList[i][j]["totalTime"],
          )
      );
    }
    weekofschedule.add(dayofschedule);
  }
}