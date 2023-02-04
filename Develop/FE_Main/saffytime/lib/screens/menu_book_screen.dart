// check menubook screen
import 'package:flutter/material.dart';
import '../custom_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuBookScreen extends StatefulWidget {
  const MenuBookScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MenuBookScreenStates();
}

class _MenuBookScreenStates extends State<MenuBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("식단표"),
      ),
      body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("MenuBookScreen"),

            CustomElevatedButton(
              onPressed: () {
                print('gg');
                requstMenuWeek(1);
              },
            ),

          ],
        ),
      ),
    );
  }
}


void requstMenuWeek(int region) async{
  var res = await http.get(Uri.parse("http://i8a602.p.ssafy.io:9090/menu/today/?region=${region}"));

  print(res.body);
  var data = json.decode(res.body);
  print(data);
}
