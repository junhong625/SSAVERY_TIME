import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CBInputTitle extends StatelessWidget {
  CBInputTitle({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      width: 390, height: 64,
      child: TextField(
        style: TextStyle(fontSize: 16, color: Color(0xff262626),
            fontWeight: FontWeight.bold),
        controller: controller, // 유저가 입력한 비밀번호
        decoration: InputDecoration(
          label: Text('상담제목',
            style: TextStyle(
            color: Color(0x40000000),
            fontWeight: FontWeight.w900,
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged: (controller) {
          print(controller);
        },
      ),
    );
  }
}

class CBTitleController extends GetxController {
  RxString myInput = ''.obs;
}