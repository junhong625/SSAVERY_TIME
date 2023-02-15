import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/schedule_week_controller.dart';
import 'package:ssafytime/widgets/schedule_single_item.dart';

import '../model/schedule_week.dart';

class ScTotal extends StatelessWidget {

  SchedulePickDayController test = Get.find<SchedulePickDayController>();

  List<Datum> scheduleList;

  ScTotal({Key? key,
    required this.scheduleList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      width: 390,
      height: 600,
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScTimeTable(),
            Column(
              children: [
                if (scheduleList.length >= 1) ... [
                  for (int idx = 0; idx < scheduleList.length; idx ++ ) ... [
                    ScSingleItem(
                      data: scheduleList[idx],
                    ),
                    // 수업이 한 시간 보다 길어질 경우 처리
                    for (int j = 1; j < scheduleList[idx].totalTime; j++) ... [
                      BlankTimeTable(color: scheduleList[idx].category)
                    ],
                    Divider(thickness: 1, height: 1, color: Color(0xffC3C6CF),),
                    scheduleList[idx].endTime == 12 ? LunchTimeTable() : SizedBox() // 점심시간 처리
                  ],
                ] else ... [
                  ScSingleItem(
                    data: Datum(),
                  ),
                  for (int j = 1; j < Datum().totalTime; j++) ... [
                    BlankTimeTable(color: Datum().category)
                  ],
                ]
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
        for (int i = 0; i < 9; i++) ...[
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            color: Colors.white,
            width: 32,
            height: 81,
            child: Column(
              children: [
                Text(
                  '${i + 9}',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: Color(0xffC3C6CF),
          )
        ]
      ],
    );
  }
}
