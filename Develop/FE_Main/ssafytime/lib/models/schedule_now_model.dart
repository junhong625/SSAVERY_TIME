import 'dart:convert';

class ScheduleNow {
  ScheduleNow({
    required this.data,
    required this.message,
    required this.isSuccess,
    required this.status,
  });

  Data data;
  String message;
  bool isSuccess;
  String status;

  factory ScheduleNow.fromRawJson(String str) =>
      ScheduleNow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScheduleNow.fromJson(Map<String, dynamic> json) => ScheduleNow(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        isSuccess: json["isSuccess"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "isSuccess": isSuccess,
        "status": status,
      };
}

class Data {
  Data({
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

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
