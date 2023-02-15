import 'dart:developer';

import 'package:get/get.dart';
import 'package:ssafytime/flutter_survey-0.1.4/models/question_result.dart';
import 'package:ssafytime/models/survey_option_model.dart';
import 'package:ssafytime/models/survey_result_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurveyController extends GetxController {
  static SurveyController get to => Get.find();

  SurveyController({required this.surveyIdx});

  final surveyIdx;
  final questions = <SurveyOption>[].obs;
  final surveyResult = <SurveyResult>[].obs;
//   final answerResultList = [];
  final answerIdxList = [].obs;
  final questionIdxList = [].obs;
  final Map<String, int> answerIdxMap = {};

  @override
  void onInit() {
    log("SurveyController : ${Get.arguments}");
    setSurveyOptions();
    super.onInit();
  }

  Future<void> setSurveyOptions() async {
    var response = await http.get(Uri.parse(
        "http://i8a602.p.ssafy.io:9090/surveys/survey/questions/$surveyIdx"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //   log("print : " + data.toString());
      questions.addAll(
        List<SurveyOption>.from(data.map((x) => SurveyOption.fromJson(x))),
      );
      questions.forEach((e) {
        e.optionList.forEach((option) {
          answerIdxMap[option.optionContent] = option.id;
        });
      });
      var tmp = Map.fromIterable(questions[0].optionList,
          key: (e) => e.optionContent, value: (e) => null);
      log("print : " + tmp.toString());
      questions.refresh();
      log("print : " + questions[0].optionList[0].optionContent);
      log("answer Map : ${answerIdxMap}");
    }
  }

  void sendSurveyResult(List<QuestionResult> result) {
    // result.forEach((element) {
    //   List<String> answerResultList = [];
    //   element.answers.forEach((e) {
    //     if (answerIdxMap.containsKey(e)) {
    //       answerResultList.add("${answerIdxMap[e]}");
    //     } else {
    //       answerResultList.add(e);
    //     }
    //   });
    //   log("answers : $answerResultList");
    // });

    result.forEach((element) {
      surveyResult.add(SurveyResult(
          questionId: "",
          response: element.answers.length > 1 ? "" : element.answers[0]));
    });
    log("=====================questionIdx : ${surveyIdx}======================");
    surveyResult.forEach((element) {
      log("answers : ${element.response}");
    });
  }
}
