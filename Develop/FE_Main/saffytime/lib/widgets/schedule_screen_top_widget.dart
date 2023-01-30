import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 홈 스크린 맨 상단 위젯
class ST extends StatefulWidget {
  final int month;
  const ST({Key? key,
    required this.month
  }) : super(key: key);

  @override
  State<ST> createState() => _State();
}

class _State extends State<ST> {
  @override
  Widget build(BuildContext context) {
    String month = widget.month.toString();
    return Container(
      padding: EdgeInsets.fromLTRB(16, 20, 19.26, 20),
      width: 390, height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('시간표', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
          ),
          Container(
            child: Text('${month}월', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: FaIcon(FontAwesomeIcons.user, size: 20,),
                    onPressed: () { print("마이 스크린 이동 기능"); }
                ),
                SizedBox(width: 22.9,),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: FaIcon(FontAwesomeIcons.bell, size: 20,),
                    onPressed: () { print("알림 스크린 이동 기능"); }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

