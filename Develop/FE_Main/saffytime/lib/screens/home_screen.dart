// main screen

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeScreenStates();
}

class _HomeScreenStates extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [Text("HomeScreen")],
      ),
    );
  }
}
