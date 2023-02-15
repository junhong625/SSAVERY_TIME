import 'package:flutter/material.dart';

import 'councel_bottom_calender.dart';

class CBDate extends StatelessWidget {
  const CBDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 390,
      width: MediaQuery.of(context).size.width * ( 71 / 392.7),
      height: 84,
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('상담 날짜', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
          ),
          Container(
            color: Colors.black12,
            // width: 358,
            width: MediaQuery.of(context).size.width * ( 358 / 392.7),
            height: 40,
            child: CBCalender(),
          )
        ],
      ),
    );
  }
}

