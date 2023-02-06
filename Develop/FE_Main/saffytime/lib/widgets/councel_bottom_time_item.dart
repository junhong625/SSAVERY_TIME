import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/councel_bottom_time.dart';

class CBTimeItem extends StatelessWidget {

  // 시간
  final String time;

  CBTimeItem({Key? key,
  required this.time,
  }) : super(key: key);

  // CBTimeController controller = Get.put(CBTimeController());
  CBTimeController controller = Get.find<CBTimeController>();

  @override
  Widget build(BuildContext context) {
    String time = this.time;
    return Obx(() => Container(
        width: 48, height: 24,
        child: Center(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              side: BorderSide(width: 1,
                color: Color(0xff0079D1)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              backgroundColor: time == controller.myPick.value ? Color(0xff0079D1) : Colors.white,
            ),
            onPressed: () {
              controller.select(time);
              FocusScope.of(context).unfocus(); // 키보트 포커스 아웃
            },
            child: Text(time,
              style: TextStyle(fontWeight: FontWeight.w900,
                fontSize: 11,
                color: time == controller.myPick.value ? Colors.white : Color(0xff0079D1)
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// 점심 시간 =================================================
class CBLunchItem extends StatelessWidget {
  CBLunchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48, height: 24,
      child: Center(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            backgroundColor: Color(0xff76777A)
          ),
          onPressed: () {
            FocusScope.of(context).unfocus(); // 키보트 포커스 아웃
          },
          child: Text('점심',
            style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: 11,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}


// 이미 예약된거 ===============================================
class CBReservedTime extends StatelessWidget {

  // 시간
  final String time;

  CBReservedTime({Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String time = this.time;
    return Container(
      width: 48, height: 24,
      child: Center(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            side: BorderSide(width: 1,
                color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            backgroundColor: Color(0xffC3C6CF)
          ),
          onPressed: () {
            FocusScope.of(context).unfocus(); // 키보트 포커스 아웃
          },
          child: Text(time,
            style: TextStyle(fontWeight: FontWeight.w900,
                fontSize: 11,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}