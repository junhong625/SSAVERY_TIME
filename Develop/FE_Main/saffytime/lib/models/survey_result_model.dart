import 'dart:convert';

class SurveyResultOption {
  SurveyResultOption({
    required this.optionList,
    required this.questionContent,
  });

  Map<String, dynamic> optionList;
  String questionContent;

  factory SurveyResultOption.fromRawJson(String str) =>
      SurveyResultOption.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SurveyResultOption.fromJson(Map<String, dynamic> json) =>
      SurveyResultOption(
        optionList: Map.from(json["optionList"])
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        questionContent: json["questionContent"],
      );

  Map<String, dynamic> toJson() => {
        "optionList":
            Map.from(optionList).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "questionContent": questionContent,
      };
}
