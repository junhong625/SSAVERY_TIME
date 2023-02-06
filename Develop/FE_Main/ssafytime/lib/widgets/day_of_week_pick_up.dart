import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pick_day_controller.dart';

class DOWP extends StatelessWidget {

  final testController = Get.put(PickDayController());

  DOWP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DateTime dt = DateTime.now();
    Map<int, List> dayList = {
      0 : ['월', dt.subtract(Duration(days: dt.weekday - 1)).day.toString()],
      1 : ['화', dt.subtract(Duration(days: dt.weekday - 2)).day.toString()],
      2 : ['수', dt.subtract(Duration(days: dt.weekday - 3)).day.toString()],
      3 : ['목', dt.subtract(Duration(days: dt.weekday - 4)).day.toString()],
      4 : ['금', dt.subtract(Duration(days: dt.weekday - 5)).day.toString()],
    };

    return Container(
      // color: Colors.black12,
      width: 390, height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int idx = 0; idx < 5; idx ++) ...[
            GetX<PickDayController>(
                builder: (controller) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                    width: 76.8,
                    child: InkWell(
                      onTap: () {
                        controller.selectDay(idx);
                      },
                      // + '${controller.ccc}'
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(dayList[idx]![0], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900,
                                color: (controller.myPick.contains(idx) ? Color(0xff3396F4) : Color(0x40000000))),),
                          ),
                          Container(
                            child: Text(dayList[idx]![1], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900,
                                color: (controller.myPick.contains(idx) ? Color(0xff3396F4) : Color(0x40000000))),),
                          ),
                          Text('${controller.ccc}', style: TextStyle(fontSize: 0.1)),
                          Container(
                            width: 65,
                            color: (controller.myPick.contains(idx) ? Color(0xff3396F4) : Color(0x003396F4)),
                            height: 3,
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
            VerticalDivider(thickness: 1, width: 1, color: Color(0xffC3C6CF)),
          ],
        ],
      ),
    );
  }
}



