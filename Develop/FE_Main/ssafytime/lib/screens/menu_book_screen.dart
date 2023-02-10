// check menubook screen
import 'package:flutter/material.dart';

import '../widgets/menu_day_of_week.dart';

class MenuBookScreen extends StatefulWidget {
  const MenuBookScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MenuBookScreenStates();
}

class _MenuBookScreenStates extends State<MenuBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("식단표"),
      ),
      body: SizedBox(
          child: Column(
        children: [
          MDay0fWeek(),
        ],
      )),
    );
  }
}
