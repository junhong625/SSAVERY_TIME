import 'package:flutter/material.dart';

class ScSingleItem extends StatelessWidget {
  Map<int, List> coding = {
    0: ['코딩과정', 0xff686ADB],
    1: ['알고리즘', 0xff0082A1],
    2: ['프로젝트', 0xffDE3730],
    3: ['기타', 0xff0079D1],
  };

  Map<int, String> place = {0: '오프라인', 1: '온라인'};

  final int classType;
  final int studyPlace;
  final String subject;
  final String content;
  // final double classTime;

  ScSingleItem({
    Key? key,
    required this.classType,
    required this.studyPlace,
    required this.subject,
    required this.content,
    // required this.classTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double heigth = 81*classTime;
    String classPlace = place[studyPlace]!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 5,
          height: 81,
          color: Colors.blueAccent, // option 1
        ),
        Container(
          width: 353,
          height: 81,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // option 2
                    Text(
                      "이렇게하면",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: Colors.black54, // option 1
                      ),
                    ),
                    // option 3
                    Text(
                      classPlace,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 8),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // option 4
                    Text(
                      subject,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                        color: Color(0xff73777F),
                      ),
                    ),
                    // SizedBox(height: 0,),
                    // option 5
                    Text(
                      content,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LunchTimeTable extends StatelessWidget {
  const LunchTimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 5,
              height: 81,
              color: Color(0xff93000A), // option 1
            ),
            Container(
                width: 353,
                height: 81,
                color: Colors.white,
                child: Center(
                    child: Text(
                  '중식',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ))),
          ],
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Color(0xffC3C6CF),
        )
      ],
    );
  }
}

// 블랭크는 구분선크기를 포함 시키되 보이면 안되니깐 컨테이너 자체 크기를 +1 해줌
class BlankTimeTable extends StatelessWidget {
  Map<int, int> colorList = {
    0: 0xff686ADB,
    1: 0xff0082A1,
    2: 0xffDE3730,
    3: 0xff0079D1,
  };

  int color;

  BlankTimeTable({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 0, color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 5,
            height: 82,
            color: Colors.amber,
          ),
          Container(
            width: 353,
            height: 82,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
