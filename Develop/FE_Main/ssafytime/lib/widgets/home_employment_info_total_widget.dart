import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/controllers/user_controller.dart';
import 'package:ssafytime/models/recruitment.dart';

import 'home_employment_info_single_widget.dart';

// 홈 스크린 채용정보 전체 위젯
class HEIT extends StatelessWidget {

  HEIT({Key? key,}) : super(key: key);
  UserController controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() => Container(
        width: 358,
        height: 300,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Text(
                '채용정보 ${controller.recruitCnt.value}건',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ),
            if (controller.recruitmentList.data == []) ... [
              const SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    '채용 중인 회사가 없습니다.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Color(0x47000000)),
                  ),
                ),
              ),
            ] else ... [
              Expanded(
                //   height: 265,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.recruitmentList.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HEIS(info: controller.recruitmentList.data![index]),
                          Container(
                            width: 326,
                            height: 1,
                            color: const Color(0xffC3C6CF),
                          )
                        ],
                      );
                    }),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
