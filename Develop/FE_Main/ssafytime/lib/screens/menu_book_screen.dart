// check menubook screen
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../widgets/menu_day_of_week.dart';
import 'package:ssafytime/controllers/loading_controller.dart';

class MenuBookScreen extends StatelessWidget {
  const MenuBookScreen({Key? key}) : super(key: key);
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
        )
      ),
    );
  }
}
