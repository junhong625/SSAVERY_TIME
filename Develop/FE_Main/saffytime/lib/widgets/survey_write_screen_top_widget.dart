import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 설문 작성 스크린 맨 위에 있는 위젯
class SWT extends StatefulWidget {
  final String title;
  const SWT({Key? key,
    required this.title}) : super(key: key);

  @override
  State<SWT> createState() => _SWTState();
}

class _SWTState extends State<SWT> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    return Container(
      padding: EdgeInsets.fromLTRB(16, 20, 19.26, 20),
      width: 390, height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
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



