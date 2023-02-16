import 'dart:developer';

import 'package:get/get.dart';
import 'package:ssafytime/models/survey_option_model.dart';
import 'package:ssafytime/models/survey_result_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurveyController extends GetxController {
  static SurveyController get to => Get.find();

  RxList<SurveyOption> questions = <SurveyOption>[].obs;
  RxList<SurveyResultOption> surveyResult = <SurveyResultOption>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  setSurveyOptions(int surveyIdx) async {
    var response = await http.get(Uri.parse(
        "http://i8a602.p.ssafy.io:9090/surveys/survey/questions/$surveyIdx"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      questions.addAll(
        List<SurveyOption>.from(data.map((x) => SurveyOption.fromJson(x))),
      );
      var tmp = Map.fromIterable(questions[0].optionList,
          key: (e) => e.optionContent, value: (e) => null);
      questions.refresh();
    }
  }

  void sendSurveyResult() {}
}
