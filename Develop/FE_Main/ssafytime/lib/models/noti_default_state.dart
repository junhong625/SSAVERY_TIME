import 'dart:convert';

class NotiDefaultState {
  NotiDefaultState({
    required this.surveyNoti,
    required this.announceNoti,
    required this.counselNoti,
  });

  bool surveyNoti;
  bool announceNoti;
  bool counselNoti;

  factory NotiDefaultState.fromRawJson(String str) =>
      NotiDefaultState.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotiDefaultState.fromJson(Map<String, dynamic> json) =>
      NotiDefaultState(
        surveyNoti: json["surveyNoti"],
        announceNoti: json["announceNoti"],
        counselNoti: json["counselNoti"],
      );

  Map<String, dynamic> toJson() => {
        "surveyNoti": surveyNoti,
        "announceNoti": announceNoti,
        "counselNoti": counselNoti,
      };
}
