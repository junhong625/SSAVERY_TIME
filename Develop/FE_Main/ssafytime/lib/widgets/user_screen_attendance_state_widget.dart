import 'package:flutter/material.dart';

class MAW extends StatefulWidget {
  // [사유결석, 임의결석, 사유지각, 임의지각, 정상출석, 전체출석] 순으로
  final List<int> stateCntList;

  const MAW({
    Key? key,
    required this.stateCntList,
  }) : super(key: key);

  @override
  State<MAW> createState() => _MAWState();
}

class _MAWState extends State<MAW> {
  @override
  Widget build(BuildContext context) {
    int a = widget.stateCntList[0];
    int b = widget.stateCntList[1];
    int c = widget.stateCntList[2];
    int d = widget.stateCntList[3];
    int e = widget.stateCntList[4];
    int f = widget.stateCntList[5];

    return Container(
        width: 390,
        height: 110,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '출결현황',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                MAWdetail(attendanceType: 0, firstCnt: a, secCnt: b),
                MAWdetail(attendanceType: 1, firstCnt: c, secCnt: d),
                MAWdetail(attendanceType: 2, firstCnt: e, secCnt: f)
              ],
            )
          ],
        ));
  }
}

// 세부사항 부분
class MAWdetail extends StatefulWidget {
  final int attendanceType; // 결석 : 0, 지각 : 1,  출석 : 2
  final int firstCnt; // 사유 or 정상 횟수
  final int secCnt; // 임의 or 전체 횟수

  const MAWdetail({
    Key? key,
    required this.attendanceType,
    required this.firstCnt,
    required this.secCnt,
  }) : super(key: key);

  @override
  State<MAWdetail> createState() => _MAWdetailState();
}

class _MAWdetailState extends State<MAWdetail> {
  @override
  Widget build(BuildContext context) {
    const Map<int, List> board = {
      0: ['결석', '사유', '임의', 0xffFF6161],
      1: ['지각', '사유', '임의', 0xffFFDA19],
      2: ['출석', '정상', '전체', 0xff3CDCFF],
    };

    List typeInfo = board[widget.attendanceType]!.toList();

    String attendanceType = typeInfo[0];
    int firstCnt = widget.firstCnt;
    String firstString = typeInfo[1];
    int color = typeInfo[3];
    int secCnt = widget.secCnt;
    String secString = typeInfo[2]; // 임의 or 전체

    return Container(
      width: 115.33, height: 62,
      // color: Colors.orangeAccent,
      child: Column(
        children: [
          Container(
            // color: Colors.deepOrangeAccent,
            width: 58, height: 42,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.black12,
                  width: 19,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 24,
                        child: FittedBox(
                            fit: BoxFit.contain,
                            // option1 사유 횟수
                            child: Text(
                              firstCnt.toString(),
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )),
                      ),
                      Container(
                        height: 16,
                        child: FittedBox(
                            fit: BoxFit.contain,
                            // option 2 사유 or 정상
                            child: Text(firstString,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff73777F)))),
                      )
                    ],
                  ),
                ),
                Container(
                    // color: Colors.greenAccent,
                    width: 19,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Container(
                            width: 2,
                            height: 20,
                            // option3 색깔
                            color: Color(color),
                          ),
                        )
                      ],
                    )),
                Container(
                  // color: Colors.cyanAccent,
                  width: 19,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 24,
                        child: FittedBox(
                            fit: BoxFit.contain,
                            // option4 임의(or 전체) 횟수
                            child: Text(
                              secCnt.toString(),
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )),
                      ),
                      Container(
                        height: 16,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          // option5 임의 or 전체
                          child: Text(
                            secString,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(0xff73777F)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            width: 26, height: 20,
            child: FittedBox(
              fit: BoxFit.contain,
              // option6 결석, 지각, 출석
              child: Text(
                attendanceType,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          )
        ],
      ),
    );
  }
}
