import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/widgets/councel_list_item.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  testController controller = Get.put(testController());

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: ExpansionPanelList(
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Text("확장패널 헤더1");
              },
              body: Text("확장패널 바디1"),
              isExpanded: _expanded,
            ),
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Text("확장패널 헤더2");
              },
              body: Text("확장패널 바디2"),
              isExpanded: _expanded,
            ),
          ],
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              _expanded = !_expanded;
            });
          },
        ),
      ),
    );
  }
}


class testController extends GetxController {
  var testInt = 0.obs;
}