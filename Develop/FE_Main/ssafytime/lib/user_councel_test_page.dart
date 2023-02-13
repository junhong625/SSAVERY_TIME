import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/widgets/councel_admin_councel.dart';
import 'package:ssafytime/widgets/councel_list_admin_item.dart';
import 'package:ssafytime/widgets/councel_list_item.dart';
import 'package:ssafytime/widgets/councel_my_councel.dart';

class UserCouncelTestPage extends StatefulWidget {
  UserCouncelTestPage({Key? key}) : super(key: key);

  @override
  State<UserCouncelTestPage> createState() => _TestPageState();
}

class _TestPageState extends State<UserCouncelTestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  CMyCouncel()
    );
  }
}

