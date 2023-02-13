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
      body: Stack(
        children: [
          SizedBox(
            child: Column(
              children: [
                MDay0fWeek(),
              ],
            )
          ),
          Obx(() =>
            Offstage(
              offstage: !loadingController.to.isLoading,
              child: Center(
                child: Container(
                  color: Color(0x50000000),
                  width: double.infinity, height: double.infinity,
                  // width: 200, height: 200,
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    size: 80,
                  ),
                ),
              )
            )
          )
        ],
      ),
    );
  }
}
