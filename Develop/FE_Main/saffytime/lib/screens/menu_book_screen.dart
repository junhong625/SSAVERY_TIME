// check menubook screen

import 'package:flutter/material.dart';

class MenuBookScreen extends StatefulWidget {
  const MenuBookScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MenuBookScreenStates();
}

class _MenuBookScreenStates extends State<MenuBookScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [Text("MenuBookScreen")],
      ),
    );
  }
}
