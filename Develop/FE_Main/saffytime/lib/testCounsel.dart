import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pjt/widgets/councel_bottom_total.dart';

import 'main.dart';

class CounselTestPage extends StatelessWidget {
  const CounselTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black12,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => {
                  Get.to(() => MyPage())
                },
                child: Text('뒤로')
              ),
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => {
                  print('상담신청'),
                  openCouncelBottomSheet()
                })
            ],
          ),
        ),
      )
    );
  }
}




