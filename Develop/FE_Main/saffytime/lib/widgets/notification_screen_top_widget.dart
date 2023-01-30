import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NT extends StatefulWidget {
  const NT({Key? key}) : super(key: key);

  @override
  State<NT> createState() => _NTState();
}

class _NTState extends State<NT> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 20, 19.26, 20),
      width: 390, height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('알림', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
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
              ],
            ),
          )
        ],
      ),
    );

  }
}
