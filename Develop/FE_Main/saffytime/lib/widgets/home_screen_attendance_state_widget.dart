import 'package:flutter/material.dart';

// 홈 스크린 출결 상태 위젯
class HA extends StatefulWidget {

  final int absent; // 결석 횟수
  final int tardy; // 지각 횟수
  final int attendance; // 출석 횟수
  final String imgURL; // 교육생 이미지 URL

  const HA({Key? key,
    required this.absent,
    required this.attendance,
    required this.tardy,
    required this.imgURL
  }) : super(key: key);

  @override
  State<HA> createState() => _HAState();
}

class _HAState extends State<HA> {
  @override
  Widget build(BuildContext context) {

    String absent = widget.absent.toString();
    String tardy = widget.tardy.toString();
    String attendance = widget.attendance.toString();
    String imgURL = widget.imgURL;

    return Container(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        width: 390, height: 58,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(imgURL),),
              ),
            ),
            Container(
              width: 284,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 91.33,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // option1 결석 횟수
                          child: Text(absent,
                              style:TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Color(0xffFF5449))),
                        ),
                        Container(
                          child: Text('결석',
                              style:TextStyle(fontWeight: FontWeight.w900, fontSize: 12,)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 91.33,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // option2 지각 횟수
                          child: Text(tardy,
                              style:TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Color(0xffFFDE49))),
                        ),
                        Container(
                          child: Text('지각',
                              style:TextStyle(fontWeight: FontWeight.w900, fontSize: 12,)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 91.33,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // option3 출석 횟수
                          child: Text(attendance,
                              style:TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Color(0xff3094F2))),
                        ),
                        Container(
                          child: Text('결석',
                              style:TextStyle(fontWeight: FontWeight.w900, fontSize: 12,)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
