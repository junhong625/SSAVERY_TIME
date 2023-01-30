import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MT extends StatefulWidget {
  const MT({Key? key}) : super(key: key);

  @override
  State<MT> createState() => _MTState();
}

class _MTState extends State<MT> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 20, 19.26, 20),
      width: 390, height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('마이페이지', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
          ),
          Container(
            child: Row(
              children: [
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
