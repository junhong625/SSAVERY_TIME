import 'dart:convert';

class UserDefaultState {
  UserDefaultState({
    this.noticeAlarm,
    this.surveyAlarm,
    this.consultingAlarm,
  });

  bool? noticeAlarm;
  bool? surveyAlarm;
  bool? consultingAlarm;

  factory UserDefaultState.fromRawJson(String str) =>
      UserDefaultState.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDefaultState.fromJson(Map<String, dynamic> json) =>
      UserDefaultState(
        noticeAlarm: json["noticeAlarm"],
        surveyAlarm: json["surveyAlarm"],
        consultingAlarm: json["consultingAlarm"],
      );

  Map<String, dynamic> toJson() => {
        "noticeAlarm": noticeAlarm,
        "surveyAlarm": surveyAlarm,
        "consultingAlarm": consultingAlarm,
      };
}
