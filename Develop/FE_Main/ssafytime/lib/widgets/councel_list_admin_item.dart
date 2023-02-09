import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ssafytime/custom_button.dart';
import 'package:ssafytime/model/councel_detail.dart';

class CouncelAdminListItem extends StatelessWidget {

  final CouncelDetail data;

  // controller 에서 받아올 값들
  double currentTime; //   currentTime: 202302061120,
  double startTime; //   startTime: 202302061100,
  double endTime; // 끝나는 시간

  CouncelAdminListItem({Key? key,
    required this.data,
    required this.currentTime,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // state 상태 값에 따른 변수
    Map table = {
      1: {
        'icon' : Icon(Icons.live_help_outlined, size: 40,)
      },
      2: {
        'icon' : Icon(Icons.mark_chat_read_outlined, size: 40,)
      },
      3: {
        'icon' : Icon(Icons.sms_failed_outlined, size: 40,)
      },
      4: {
        'icon' : Icon(Icons.done, size: 40,)
      },
    };

    String title = data.title; // 제목
    double rezTime = data.rezTime; // 예약 시간 12.0 등
    String? reject = data.reject; // 거절 사유
    String name = data.name; // 신청자 이름
    String category = data.category; // 카테고리
    int state = data.state; //  대기(1), 승인(2), 거절(3), 종료(4)
    String? url = data.meetUrl; // 상담 url

    String councelTime = getCouncelTime(rezTime); // 13:00 ~ 14:00
    String councelDate = CItemDate(startTime);
    double opacity = currentTime > endTime ? 0.4 : 1;

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ExpansionTile(
        leading: table[state]['icon'],
        title: Column(
          children: [
            Text('${name} - ${category}'),
            Text('${councelDate} ${councelTime}')
          ],
        ),
        children: [
          Text(title),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (state == 1) ... [
                CustomElevatedButton(
                  label: '승인',
                  width: 100, height: 40,
                  onPressed: () {}
                ),
                CustomElevatedButton(
                    label: '거절',
                    width: 100, height: 40,
                    onPressed: () {}
                )
                ] else if (state == 2) ... [
                  CustomElevatedButton(
                      label: '상담하기',
                      width: 100, height: 40,
                      onPressed: () {}
                  ),
                ] else if (state == 3) ... [
                  Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                        text: TextSpan(
                            text: '거절사유 : ${reject}',
                            style: TextStyle(
                              color: Colors.black,
                              height: 1.4,
                            )
                        ),
                      )
                  ),
                ] else ... [
                  Text('종료')
                ]
              ],
            )
          ),
        ],
        trailing: Container(
          width: 0,
        ),
      ),
    );
  }

}


// 진행 중일때 나타위젯 프로그래스바 있는거 =========================================
class CItemIng extends StatelessWidget {

  double currentTime; // 현재시간 202302061530.0 이런 형태로 들어옴
  double startTime; // 시작 시간
  double endTime; // 끝나는 시간

  double rezTime; // 시작 시간 13.5 이런 형태

  CItemIng({Key? key,
    required this.currentTime,
    required this.startTime,
    required this.endTime,
    required this.rezTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double persent = CItemPersent(currentTime, rezTime);
    String councelTime = getCouncelTime(rezTime); // 13:00 ~ 14:00
    return Container(
      width: 280,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            lineHeight: 8,
            barRadius: const Radius.circular(4),
            percent: persent, // optinal 6_1
            progressColor: const Color(0xffFC6161),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // option 6
              Text(
                councelTime,
                style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xffABABAE),
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// 스트링으로 날짜 뽑기 2023-02-06
String CItemDate(double startTime) {
  String v = '';
  String tmp = startTime.toInt().toInt().toString();
  String y = tmp.substring(0, 4);
  String m = tmp.substring(4, 6);
  String d = tmp.substring(6, 8);

  v = '${y}-${m}-${d}' ;
  return v;
}


// rezTime 을 받아서 13:00 ~ 14:00 이렇게 바꿔주기
String getCouncelTime(double rezTime) {
  int sh = rezTime.toInt(); // 시작 시간
  int eh = sh+1; // 종료 시간
  int m = ((rezTime - sh)*60).toInt(); // 분
  String min = '00';
  if (m > 0) {
    min = '30';
  }

  return '${sh}:${min} ~ ${eh}:${min}';
}

// 얼마나 지났는지 퍼센트 구하기
double CItemPersent(double currentTime, double rezTime) {
  // double rezTime = 14.5;
  int sh = rezTime.toInt(); // 시작 시간
  int m = ((rezTime - sh)*60).toInt(); // 분
  int exRezTime = sh*60 + m; // 분으로 환산한 rezTime

  // 현재 시간 계산
  // currentTime = 202302061530.0;
  String b = currentTime.toInt().toInt().toString().substring(8, 10); // 시간
  String c = currentTime.toInt().toInt().toString().substring(10, 12); // 분
  int ch = int.parse(b)*60; // 시간을 분으로 맞춰주기
  int cm = int.parse(c);
  int exCurrentTime = ch + cm; // 분으로 환산한 currentTime

  return (exCurrentTime - exRezTime)/60;
}