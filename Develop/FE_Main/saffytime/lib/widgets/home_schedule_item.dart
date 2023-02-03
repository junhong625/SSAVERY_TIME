import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

// HSIW 홈스크린 스케줄 아이템 위젯
// 변수값 설명은 노션 참고
class HSIW extends StatefulWidget {
  final int color;
  final String category;
  final String studyPlace;
  final String subject;
  final String content;
  final String classTime;
  final bool isClassTime;
  final double progressPercent;


  const HSIW({Key? key,
    required this.color,
    required this.category,
    required this.studyPlace,
    required this.subject,
    required this.content,
    required this.classTime,
    required this.isClassTime,
    required this.progressPercent}) : super(key: key);

  @override
  State<HSIW> createState() => _HSIWState();
}

class _HSIWState extends State<HSIW> {

  @override
  Widget build(BuildContext context) {

    int color = widget.color;
    String category = widget.category;
    String studyPlace = widget.studyPlace;
    String subject = widget.subject;
    String content = widget.content;
    String classTime = widget.classTime;
    bool isClassTime = widget.isClassTime;
    double progressPercent = widget.progressPercent;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 5,
          height: 160,
          color: Color(color), // option 1
        ),
        Container(
          width: 360,
          height: 160,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // option 2
                    Text(category, style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: Color(0xff686ADB), // option 1
                    ),),
                    // option 3
                    Text(studyPlace, style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 11),),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(16, 14, 16, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // option 4
                    Text(subject,
                      style: TextStyle(fontWeight: FontWeight.w900,
                        fontSize: 16, color: Color(0xff73777F),
                      ),
                    ),
                    SizedBox(height: 4,),
                    // option 5
                    Text(content,
                      style: TextStyle(fontWeight: FontWeight.w900,
                          fontSize: 28),)
                  ],
                ),
              ),
              // option 7 수업 중이냐 전이냐
              Column(
                children: [
                  // 수업 중 /////////
                  if (isClassTime == true)
                    Column(
                      children: [
                        LinearPercentIndicator(
                          width: 350,
                          lineHeight: 8,
                          barRadius: Radius.circular(4),
                          percent: progressPercent, // optinal 6_1
                          progressColor: Color(0xffFC6161),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // option 6
                            Text(classTime, style: TextStyle(
                                fontSize: 11, color: Color(0xffABABAE),
                                fontWeight: FontWeight.w900
                            ),),
                            SizedBox(width: 16,),
                          ],
                        ),
                      ],
                    ),
                  // 수업 전 /////////
                  if (isClassTime == false)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // option 6
                        Text(classTime, style: TextStyle(
                            fontSize: 24, color: Color(0xffABABAE),
                            fontWeight: FontWeight.w900
                        ),),
                        SizedBox(width: 16,),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}



