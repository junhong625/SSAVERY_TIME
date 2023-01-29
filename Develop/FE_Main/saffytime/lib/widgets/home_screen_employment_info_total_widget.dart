import 'package:flutter/material.dart';

import 'home_screen_employment_info_single_widget.dart';

// 홈 스크린 채용정보 전체 위젯
class HEIT extends StatefulWidget {

  final List infoList; // api로 받을 데이터가 어떨지 몰라서

  const HEIT({Key? key,
    required this.infoList}) : super(key: key);

  @override
  State<HEIT> createState() => _HEITState();
}

class _HEITState extends State<HEIT> {
  @override
  Widget build(BuildContext context) {

    List infoList = widget.infoList;

    return Container(
      width: 358, height: 300,
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
            child: Text('채용정보', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
          ),
          if (infoList.length == 0)
            Container(
              height: 200,
              child: Center(
                child: Text('채용 중인 회사가 없습니다.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900,
                      color: Color(0x47000000)),),
              ),
            ),
          if (infoList.length != 0)
            Container(
              height: 265,
              child: ListView.builder(
                  itemCount: infoList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HEIS(info: infoList[index]),
                        Container(
                          width: 326, height: 1,
                          color: Color(0xffC3C6CF),
                        )
                      ],
                    );
                  }
              ),
            ),
        ],
      ),
    );
  }
}
