import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ssafytime/controllers/councel_controller.dart';
import 'package:ssafytime/custom_button.dart';
import 'package:ssafytime/model/councel_detail.dart';
import 'package:ssafytime/widgets/custom_text.dart';

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

  MyCouncelController controller = Get.find<MyCouncelController>();
  TextEditingController _textController = TextEditingController(); // 거절사유

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
              CustomText(content: '${name}'),
              CustomText(content: '${councelDate} ${councelTime}', fontSize: 15,)
            ],
          ),
          children: [
            CustomText(content: category,),
            CustomText(content: title),
            ListTile(
              title: Column(
                children: [
                  Container(
                    child: Row(
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
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('거절 사유를 입력해주세요.'),
                                    content: TextField(
                                      controller: _textController,
                                      textInputAction: TextInputAction.go,
                                      decoration: InputDecoration(hintText: '거절 사유',
                                        suffixIcon: IconButton(
                                          onPressed: _textController.clear,
                                          icon: Icon(Icons.clear),
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      CustomElevatedButton(
                                        label: '제출',
                                        width: 100, height: 40,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }
                                      ),
                                      CustomElevatedButton(
                                          label: '닫기',
                                          width: 100, height: 40,
                                          onPressed: () {
                                            _textController.clear();
                                            Navigator.of(context).pop();
                                          }
                                      )
                                    ],
                                    actionsAlignment: MainAxisAlignment.spaceAround
                                  );
                                }
                              );
                            }
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
                    ),
                  ),
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