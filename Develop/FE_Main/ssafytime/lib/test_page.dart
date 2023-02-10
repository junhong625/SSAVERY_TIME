import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/widgets/councel_admin_councel.dart';
import 'package:ssafytime/widgets/councel_list_admin_item.dart';
import 'package:ssafytime/widgets/councel_list_item.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Container(
          color: Colors.lightBlueAccent,
          width: 400, height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpansionTile(
                title: Text('야야야야'),
                trailing: Container(width: 0,),
                children: [
                  ExpansionTile(
                    title: Text('11324115'),
                    children: [
                      Container(
                        color: Colors.black,
                        width: 100, height: 100,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

