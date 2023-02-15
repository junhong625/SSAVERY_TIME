// do survey screen

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/survey_controller.dart';
import 'package:ssafytime/flutter_survey-0.1.4/flutter_survey.dart';

class SurveyScreen extends StatefulWidget {
  SurveyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SurveyScreen();
}

class _SurveyScreen extends State<SurveyScreen> {
  final _formKey = GlobalKey<FormState>();
  List<QuestionResult> _questionResult = [];

  late SurveyController surveyC;
  @override
  void initState() {
    surveyC = Get.put(SurveyController(surveyIdx: Get.arguments));
    super.initState();
  }

//   SurveyController surveyC = Get.put(SurveyController(surveyIdx: surveyIdx));

  @override
  Widget build(BuildContext context) {
    // Get.put(SurveyController());
    // surveyC.setSurveyOptions(Get.arguments);
    log("test");
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text("설문조사")),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: SafeArea(
            child: surveyC.questions.length > 0
                ? Form(
                    key: _formKey,
                    child: Survey(
                      defaultErrorText: "문항을 선택해주세요",
                      initialData: [
                        for (int i = 0; i < surveyC.questions.length; i++) ...[
                          surveyC.questions[i].optionList.length > 1
                              ? Question(
                                  isMandatory: true,
                                  question:
                                      surveyC.questions[i].questionContent,
                                  answerChoices: Map.fromIterable(
                                      surveyC.questions[i].optionList,
                                      key: (e) => e.optionContent,
                                      value: (e) => null),
                                )
                              : Question(
                                  isMandatory: true,
                                  question:
                                      surveyC.questions[i].questionContent),
                        ]
                      ],
                      onNext: (questionResults) {
                        _questionResult = questionResults;
                        //   log(questionResults.toString());
                      },
                    ),
                  )
                : Text("test"),
          ),
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
                      surveyC.sendSurveyResult(_questionResult);
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
