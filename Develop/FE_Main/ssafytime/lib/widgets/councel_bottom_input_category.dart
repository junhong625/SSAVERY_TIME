import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/councel_bottom.dart';
import '../model/councel_bottom.dart';

class CBCategoryTotal extends StatelessWidget {
  CBCategoryTotal({Key? key}) : super(key: key);

  TextEditingController textController = TextEditingController();
  CBCategoryController controller = Get.put(CBCategoryController());

  @override
  Widget build(BuildContext context) {
    staticCategory table = staticCategory();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.cyan,
          width: 390, height: 64,
          child: TextField(
            style: TextStyle(fontSize: 16, color: Color(0xff262626),
                fontWeight: FontWeight.bold),
            controller: textController, // 유저가 입력한 비밀번호
            decoration: InputDecoration(
              label: Text('카테고리를 입력하세요.',
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
        ),
        Container(
          child: Text('ex) 취업, BE, FE, 알고리즘 등',
            style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: 10, color: Colors.black54
            ),
          ),
        )
      ],
    );
  }
}
