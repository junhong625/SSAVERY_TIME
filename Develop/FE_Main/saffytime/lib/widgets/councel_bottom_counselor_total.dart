import 'package:flutter/material.dart';

import 'councel_bottom_ counselor_item.dart';

class CBCouncelorTotal extends StatelessWidget {

  // 받아올 데이터 예시
  Map<int, List> councelorList = {
    // [관리자 아이디, 이름, 담당?, 이미지 URL]
    0 : [12314, '황싸피', '컨설턴트', 'asset/tmp.png'],
    1 : [24235, '안싸피', '코치', 'asset/tmp.png'],
    2 : [23424, '김싸피', '코치', 'asset/tmp.png'],
    3 : [34523, '고싸피', '프로', 'asset/tmp.png'],
  };

  // final Map<int, List<String>> councelorList;

  CBCouncelorTotal({Key? key,
    // required this.councelorList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyanAccent,
      width: 390,height: 92,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i=0; i < councelorList.length; i++) ... [
            CBCounselorItem(
              name: councelorList[i]![1],
              position: councelorList[i]![2],
              imgUrl: councelorList[i]![3],
              managerId: councelorList[i]![0],
            ),
          ]
        ],
      ),
    );
  }
}
