import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/councel_bottom.dart';

class CBCounselorItem extends StatelessWidget {

  final String name; // 이름
  final String position; // 컨설턴트, 프로, 등의 담당업무?
  final String imgUrl; // 이미지 URL
  final int managerId; // 관리자 ID


  CBCounselorItem({Key? key,
    required this.name,
    required this.position,
    required this.imgUrl,
    required this.managerId
  }) : super(key: key);

  CBCouncelorController controller = Get.put(CBCouncelorController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
        onTap: () {
          controller.select(managerId);
          FocusScope.of(context).unfocus(); // 키보트 포커스 아웃
        },
        child: Container(
          width: 71, height: 84,
          decoration: BoxDecoration(
            color: controller.myPick.value == managerId ? Color(0xffE7E7E7) : Colors.white,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(imgUrl),),
                ),
              ),
              Container(
                child: Text(name, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 11),),
              ),
              Container(
                child: Text(position, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
