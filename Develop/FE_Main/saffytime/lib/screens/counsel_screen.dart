// check and regist counsel screen

import 'package:flutter/material.dart';

class CounselScreen extends StatefulWidget {
  const CounselScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CounselScreenStates();
}

class _CounselScreenStates extends State<CounselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("상담")),
      body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text("CounselScreen")],
        ),
      ),
    );
  }
}
