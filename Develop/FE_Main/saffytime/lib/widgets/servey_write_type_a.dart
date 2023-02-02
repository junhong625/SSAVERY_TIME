import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class SWTypeA extends StatelessWidget {
//   const SWTypeA({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(SWTypeAController());
//     return Container(
//       padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
//       width: 390, height: 224,
//       color: Colors.black12,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('1. 설문조사 항목내용', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
//           Container(
//             padding: EdgeInsets.fromLTRB(16, 2, 0, 0),
//             child: Text('설문조사 내용', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900,
//               color: Color(0xff40000000)),),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class SWRido extends StatefulWidget {
  const SWRido({Key? key}) : super(key: key);

  @override
  State<SWRido> createState() => _SWRidoState();
}

class _SWRidoState extends State<SWRido> {

  String _answer = '1번';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text('1번 문항'),
          value: '1번',
          groupValue: _answer,
          onChanged: (value) {
            setState(() {
              _answer = value!;
            });
          }
        ),
        RadioListTile(
            title: Text('2번 문항'),
            value: '2번',
            groupValue: _answer,
            onChanged: (value) {
              setState(() {
                _answer = value!;
              });
            }
        ),
        RadioListTile(
            title: Text('3번 문항'),
            value: '3번',
            groupValue: _answer,
            onChanged: (value) {
              setState(() {
                _answer = value!;
              });
            }
        ),
      ],
    );
  }
}
