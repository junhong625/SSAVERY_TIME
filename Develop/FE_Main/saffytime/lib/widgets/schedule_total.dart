import 'package:flutter/material.dart';
import 'package:test_pjt/widgets/schedule_single_item.dart';

class ScTotal extends StatelessWidget {

  // 입력값 예시임 API로 받아와야함
  Map classList = {
    // 수업종류, 제목, 내용, 오프라인 여부, 시작시간, 종료시간, 총시간
    // 수업 시간 순서대로 넣어야함
    0 : [0, '프레임워크 : 스프링', '수업내용...', 0, 9, 10, 1],
    1 : [2, '프로젝트', '수업내용...', 0, 10, 12, 2],
    2 : [1, '알고리즘', '수업내용...', 0, 13, 16, 3],
    3 : [0, '프레임워크 : 스프링2', '수업내용...', 0, 16, 18, 2],
  };

  ScTotal({Key? key,
  required this.classList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      width: 390, height: 600,
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScTimeTable(),
            Column(
              children: [
                for (int idx = 0; idx < classList.length; idx ++ ) ... [
                  ScSingleItem(
                    classType: classList[idx][0],
                    studyPlace: classList[idx][3],
                    subject: classList[idx][1],
                    content: classList[idx][2]),
                  // 수업이 한 시간 보다 길어질 경우 처리
                  for (int j = 1; j < classList[idx][6]; j++) ... [
                    BlankTimeTable(color: classList[idx][0])
                  ],
                  Divider(thickness: 1, height: 1, color: Color(0xffC3C6CF),),
                  classList[idx][5] == 12 ? LunchTimeTable() : SizedBox() // 점심시간 처리
                ],
              ],
            )
          ],
        ),
      ),
    );
  }
}


class ScTimeTable extends StatelessWidget {
  const ScTimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        for (int i = 0; i < 9; i++) ... [
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            color: Colors.white,
            width: 32, height: 81,
            child: Column(
              children: [
                Text('${i+9}',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
              ],
            ),
          ),
          Divider(thickness: 1, height: 1, color: Color(0xffC3C6CF) ,)
        ]
      ],
    );
  }
}
