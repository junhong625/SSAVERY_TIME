// do survey screen

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/survey_controller.dart';
import 'package:ssafytime/flutter_survey-0.1.4/flutter_survey.dart';

class SurveyScreen extends GetView<SurveyController> {
  SurveyScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  List<QuestionResult> _questionResult = [];

  @override
  Widget build(BuildContext context) {
    var surveyIdx = Get.arguments ?? 1;
    Get.put(SurveyController());
    controller.setSurveyOptions(surveyIdx);
    log("test");
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text("설문조사")),
        body: SafeArea(
          child: controller.questions.length > 0
              ? Form(
                  key: _formKey,
                  child: Survey(
                    defaultErrorText: "문항을 선택해주세요",
                    initialData: [
                      for (int i = 0; i < controller.questions.length; i++) ...[
                        controller.questions[i].optionList.length > 1
                            ? Question(
                                isMandatory: true,
                                question:
                                    controller.questions[i].questionContent,
                                answerChoices: Map.fromIterable(
                                    controller.questions[i].optionList,
                                    key: (e) => e.optionContent,
                                    value: (e) => null),
                              )
                            : Question(
                                isMandatory: true,
                                question:
                                    controller.questions[i].questionContent),
                      ]
                    ],
                    onNext: (questionResults) {
                      _questionResult = questionResults;
                    },
                  ),
                )
              : Text("test"),
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text(
                    "그만하기",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.cyanAccent,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text(
                    "제출하기",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log(_questionResult.toString());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
