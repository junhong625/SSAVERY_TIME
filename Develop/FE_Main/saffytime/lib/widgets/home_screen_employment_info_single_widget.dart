import 'package:flutter/material.dart';

// 홈 스크린 채용정보 단일 위젯
class HEIS extends StatefulWidget {

  final List info; // [회사 이름, 채용내용, 기간]
  // final String name; // 회사 정보
  // final String detail; // 채용 내용
  // final String period; // 채용 기간

  const HEIS({Key? key,
    // required this.detail,
    // required this.name,
    // required this.period,
    required this.info,
    }) : super(key: key);

  @override
  State<HEIS> createState() => _HEISState();
}

class _HEISState extends State<HEIS> {
  @override
  Widget build(BuildContext context) {
    String name = widget.info[0];
    String detail = widget.info[1];
    String period = widget.info[2];
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      width: 358, height: 87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(detail,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Color(0x58000000)),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(196, 0, 0, 0),
            child: Text(period,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: Color(0x58000000)),
            ),
          )
        ],
      ),
    );
  }
}
