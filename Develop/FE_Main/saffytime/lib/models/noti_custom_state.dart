import 'dart:convert';

class NotiCustomState {
  NotiCustomState({
    required this.title,
    required this.repeatDate,
    required this.time,
    required this.isOn,
  });

  String title;
  List<bool> repeatDate;
  DateTime time;
  bool isOn;

  factory NotiCustomState.fromRawJson(String str) =>
      NotiCustomState.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotiCustomState.fromJson(Map<String, dynamic> json) =>
      NotiCustomState(
        title: json["title"],
        repeatDate: List<bool>.from(json["repeatDate"].map((x) => x)),
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
