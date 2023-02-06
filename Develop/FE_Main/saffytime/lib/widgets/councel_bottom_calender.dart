import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/councel_bottom_date.dart';


class CBCalender extends StatelessWidget {

  CBCalender({Key? key}) : super(key: key);

  CBDatePickController controller = Get.put(CBDatePickController());

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
              DateTime? pickedDate = await showDatePicker(
                context: context,
                // 하루 뒤 부터 예약가능
                initialDate: DateTime.now().add(Duration(hours: 24)),
                firstDate: DateTime.now().add(Duration(hours: 24)),
                lastDate: DateTime.now().add(Duration(hours: 720)),
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
