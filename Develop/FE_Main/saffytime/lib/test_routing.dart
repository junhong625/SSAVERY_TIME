import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pjt/controllers/pick_day_controller.dart';
import 'package:test_pjt/main.dart';
import 'package:test_pjt/testCounsel.dart';


class TestRouting extends StatelessWidget {
  const TestRouting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300, height: 100,
          color: Colors.black54,
          child: ElevatedButton(
            onPressed: () {
              Get.delete<PickDayController>();
              Get.to(() => MyPage());
            },
            child: Text('에베베'),
          )
        )
      ),
    );
  }
}
