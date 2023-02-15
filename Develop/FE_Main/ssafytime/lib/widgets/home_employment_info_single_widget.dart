import 'package:flutter/material.dart';
import 'package:ssafytime/models/recruitment.dart';

// 홈 스크린 채용정보 단일 위젯
class HEIS extends StatelessWidget {
  final recruitCompany info;

  const HEIS({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = info.company!;
    String detail = info.job!;
    String period = info.date!;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      width: 358,
      height: 87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              '모집분야 : ' + detail,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0x58000000)),
            ),
          ),
          Row(
              // padding: const EdgeInsets.fromLTRB(196, 0, 0, 0),
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  period,
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      color: Color(0x58000000)),
                ),
              ])
        ],
      ),
    );
  }
}
