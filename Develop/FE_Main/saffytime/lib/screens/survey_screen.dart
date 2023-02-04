// do survey screen

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffytime/controllers/survey_controller.dart';
import 'package:saffytime/flutter_survey-0.1.4/flutter_survey.dart';

class SurveyScreen extends GetView<SurveyController> {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var surveyIdx = Get.arguments ?? 0;
    Get.put(SurveyController());
    controller.setSurveyOptions(surveyIdx);
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text("설문조사")),
        body: SafeArea(
          child: Survey(initialData: [
            for (int i = 0; i < controller.questions.length; i++) ...[
              Question(
                isMandatory: true,
                question: controller.questions[i].questionContent,
                answerChoices: Map.fromIterable(
                  controller.questions[i].optionList
                      .map((e) => e.optionContent),
                ),
              ),
            ]
          ]),
        ),
      ),
    );
  }
}
