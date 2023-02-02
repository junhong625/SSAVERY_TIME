import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CBCalender extends StatelessWidget {

  CBCalender({Key? key}) : super(key: key);

  calenderPickController controller = Get.put(calenderPickController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(controller.myDate.value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              print("따라라란");
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                String formattedDate = DateFormat('yyyy-MM-dd-EE').format(pickedDate);
                List<String> formatDateList = formattedDate.split('-');
                controller.selectDate(formatDateList);
              }
            },
            child: Text('날짜 선택',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color: Color(0xff73777F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class calenderPickController extends GetxController{
  RxString myDate = ''.obs;
  void selectDate(List dateList) {
    const Map<String, String> Eformat = {
      'Sun' : '일',
      'Mon' : '월',
      'Tue' : '화',
      'Wed' : '수',
      'Thu' : '목',
      'Fri' : '금',
      'Sat' : '토',
    };
    var EE = Eformat[dateList[3]]; // 요일
    myDate.value = '${dateList[0]}년 ${dateList[1]}월 ${dateList[2]}일 (${EE})';
  }
}
