import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/councel_bottom_councelor.dart';
import 'councel_bottom_counselor_item.dart';

class CBCouncelorTotal extends StatelessWidget {

  // // 받아올 데이터 예시
  // Map<int, List> councelorList = {
  //   // [관리자 아이디, 이름, 담당?, 이미지 URL]
  //   0 : [12314, '황싸피', '컨설턴트', 'asset/tmp.png'],
  //   1 : [24235, '안싸피', '코치', 'asset/tmp.png'],
  //   2 : [23424, '김싸피', '코치', 'asset/tmp.png'],
  //   3 : [34523, '고싸피', '프로', 'asset/tmp.png'],
  //   4 : [53221, '최싸피', '프로', 'asset/tmp.png'],
  // };

  List<String> adminCode = ['학생', '컨설턴트', '프로', '교수', '코치', '취업'];

  CBCouncelorTotal({Key? key,
    // required this.councelorList
  }) : super(key: key);

  // CBCouncelorController controller = Get.put(CBCouncelorController());
  CBCouncelorController controller = Get.find<CBCouncelorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        color: Colors.cyanAccent,
        width: 390,height: 92,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i=0; i < controller.councelorList.length; i++) ... [
              CBCounselorItem(
                name: controller.councelorList[i].userName,
                position: adminCode[controller.councelorList[i].isAdmin],
                // imgUrl: controller.councelorList[i].userImg,
                imgUrl: 'asset/tmp.png', // 임시 방편
                managerId: controller.councelorList[i].userIdx,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
