import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pjt/controllers/pick_day_controller.dart';
import 'package:test_pjt/testCalender.dart';
import 'package:test_pjt/testCounsel.dart';
import 'package:test_pjt/test_routing.dart';
import 'package:test_pjt/widgets/schedule_time_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyPage()
    );
  }
}

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  PickDayController testController = Get.put(PickDayController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => TestRouting());
                    print('!!');
                  },
                  child: Text('이동')
                ),
                ElevatedButton(
                  onPressed: () {
                    testController.addItem();
                    print('!!');
                  },
                  child: Text("추가")
                ),
                ElevatedButton(
                  onPressed: () {
                    testController.changeItem();
                    print('삭제');
                  },
                  child: Text('삭제')
                ),
                Text("myPick : ${testController.myPick}", style: TextStyle(fontSize: 20),),
                ///// ---------------------------------------------/////
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => CounselTestPage());
                    },
                    child: Text('상담')
                ),
                TestCalender(),
              ],
            ),
          ),
        ),
      )
    );
  }
}

