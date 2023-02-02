import 'package:flutter/material.dart';
import 'package:test_pjt/widgets/schedule_time_table.dart';

class RWtypeA extends StatefulWidget {

  RWtypeA({super.key});

  @override
  State<RWtypeA> createState() => _RWtypeAState();
}

class _RWtypeAState extends State<RWtypeA> {
  int myAnswer = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: myAnswer,
              onChanged: (value) {
                setState(() {
                  myAnswer = value!;
                });
                print(value);
              },
            ),
            Text('매우 만족', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),)
          ],
        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: myAnswer,
              onChanged: (value) {
                setState(() {
                  myAnswer = value!;
                });
                print(value);
              },
            ),
            Text('만족', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),)
          ],
        ),
        Row(
          children: [
            Radio(
              value: 3,
              groupValue: myAnswer,
              onChanged: (value) {
                setState(() {
                  myAnswer = value!;
                });
              },
            ),
            Text('보통', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),)
          ],
        ),
        Row(
          children: [
            Radio(
              value: 4,
              groupValue: myAnswer,
              onChanged: (value) {
                setState(() {
                  myAnswer = value!;
                });
              },
            ),
            Text('불만족', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),)
          ],
        ),
        Row(
          children: [
            Radio(
              value: 5,
              groupValue: myAnswer,
              onChanged: (value) {
                setState(() {
                  myAnswer = value!;
                });
              },
            ),
            Text('매우 불만족', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),)
          ],
        ),
      ],
    );
  }
}
