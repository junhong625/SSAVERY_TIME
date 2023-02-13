import 'dart:convert';

class UserCustomAlarm {
  UserCustomAlarm({
    required this.title,
    required this.repeatDate,
    required this.time,
    required this.isOn,
  });

  String title;
  List<DateTime> repeatDate;
  DateTime time;
  bool isOn;

  factory UserCustomAlarm.fromRawJson(String str) =>
      UserCustomAlarm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserCustomAlarm.fromJson(Map<String, dynamic> json) =>
      UserCustomAlarm(
        title: json["title"],
        repeatDate: List<DateTime>.from(json["repeatDate"].map((x) => x)),
        time: DateTime.parse(json["time"]),
        isOn: json["isOn"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "repeatDate": List<dynamic>.from(repeatDate.map((x) => x)),
        "time": time.toIso8601String(),
        "isOn": isOn,
      };
}
