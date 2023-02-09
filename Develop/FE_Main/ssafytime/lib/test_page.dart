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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CouncelAdminListItem(
            //   rezTime: 13.5,
            //   endTime: 202302061430,
            //   startTime: 202302061630,
            //   currentTime: 202302061530.0,
            //   title: '앞의로의 진로방향에 대해 고민이 있습니다.',
            //   reject: '',
            //   category: '진로 상담',
            //   name: '김아무개',
            //   state: 1,
            //   url: 'dsfdf'
            // ),

            // Container(
            //   width: 400,
            //   child: ExpansionTile(
            //     leading: Icon(Icons.ac_unit),
            //     title: Text('Expansion Tile'),
            //     children: <Widget>[
            //       ListTile(
            //         title: Text('Item 1'),
            //       ),
            //       ListTile(
            //         title: Text('Item 2'),
            //       ),
            //     ],
            //     trailing: Container(
            //       width: 0,
            //     ),
            //   ),
            // ),
            //
            //
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   child: ExpansionTile(
            //     leading: Icon(Icons.ac_unit),
            //     title: Text('Expansion Tile'),
            //     children: <Widget>[
            //       ListTile(
            //         title: Text('Item 1'),
            //       ),
            //       ListTile(
            //         title: Text('Item 2'),
            //       ),
            //     ],
            //     trailing: Container(
            //       width: 0,
            //     ),
            //   ),
            // ),


          ],
        )
      ),
    );
  }
}

