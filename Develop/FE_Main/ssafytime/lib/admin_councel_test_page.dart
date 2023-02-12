import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssafytime/widgets/councel_admin_councel.dart';
import 'package:ssafytime/widgets/councel_list_admin_item.dart';
import 'package:ssafytime/widgets/councel_list_item.dart';

class AdminCouncelTestPage extends StatefulWidget {
  AdminCouncelTestPage({Key? key}) : super(key: key);

  @override
  State<AdminCouncelTestPage> createState() => _TestPageState();
}

class _TestPageState extends State<AdminCouncelTestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CAdminCouncel()
    );
  }
}

