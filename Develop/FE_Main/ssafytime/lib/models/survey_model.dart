import 'dart:convert';

class SurveyList {
  SurveyList({
    this.survey,
  });

  List<Survey>? survey;

  factory SurveyList.fromRawJson(String str) =>
      SurveyList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SurveyList.fromJson(Map<String, dynamic> json) => SurveyList(
        survey: json["survey"] == null
            ? []
            : List<Survey>.from(json["survey"]!.map((x) => Survey.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "survey": survey == null
            ? []
            : List<dynamic>.from(survey!.map((x) => x.toJson())),
      };
}

class Survey {
  Survey({
    this.title,
    this.status,
    this.category,
    this.startDate,
    this.endDate,
  });

  String? title;
  int? status;
  int? category;
  DateTime? startDate;
  DateTime? endDate;

  factory Survey.fromRawJson(String str) => Survey.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
        title: json["title"],
        status: json["status"],
        category: json["category"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "status": status,
        "category": category,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
      };
}
