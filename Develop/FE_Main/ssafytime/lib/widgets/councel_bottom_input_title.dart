import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/councel_bottom_text.dart';


class CBInputTitle extends StatefulWidget {
  CBInputTitle({Key? key}) : super(key: key);

  @override
  State<CBInputTitle> createState() => _CBInputTitleState();
}

class _CBInputTitleState extends State<CBInputTitle> {
  TextEditingController textController = TextEditingController();

  // CBTitleController controller = Get.put(CBTitleController());
  CBTitleController controller = Get.find<CBTitleController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      width: 390, height: 64,
      child: TextField(
        style: TextStyle(fontSize: 16, color: Color(0xff262626),
            fontWeight: FontWeight.bold),
        controller: textController,
        decoration: InputDecoration(
          label: Text('상담제목',
            style: TextStyle(
            color: Color(0x40000000),
            fontWeight: FontWeight.w900,
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged: (textController) {
          controller.myInput.value = textController;
        },
      ),
    );
  }
}
