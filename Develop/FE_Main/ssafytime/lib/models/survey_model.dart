import 'dart:convert';

class SurveyModel {
  SurveyModel({
    required this.idx,
    required this.title,
    required this.status,
    required this.category,
    required this.startDate,
    required this.endDate,
  });

  int idx;
  String title;
  int status;
  int category;
  DateTime startDate;
  DateTime endDate;

  factory SurveyModel.fromRawJson(String str) =>
      SurveyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SurveyModel.fromJson(Map<String, dynamic> json) => SurveyModel(
        idx: json["idx"],
        title: json["title"],
        status: json["status"],
        category: json["category"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        // options:
        //     List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idx": idx,
        "title": title,
        "status": status,
        "category": category,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        // "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}
