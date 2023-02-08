// check calendar screen

import 'package:flutter/material.dart';
import 'package:ssafytime/widgets/schedule_day_of_week.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CalendarScreenStates();
}

class _CalendarScreenStates extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("시간표"),
      ),
      body: SizedBox(
        child: Column(
          children: [
            SDay0fWeek(),
          ],
        ),
      ),
    );
  }
}
