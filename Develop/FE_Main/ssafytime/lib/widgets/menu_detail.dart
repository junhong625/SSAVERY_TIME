import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/menu_detail.dart';

void openMenuDetail(int id) async {

  var res = await http.get(Uri.parse('http://i8a602.p.ssafy.io:9090/menu/detail?id=${id}'));
  var data = json.decode(res.body);

  MenuDetail myMenu = MenuDetail(
    region: data['data']["region"],
    course: data['data']["course"],
    mainMenu: data['data']["mainMenu"],
    sideMenu: List<String>.from(data['data']["sideMenu"].map((x) => x)),
    cho: data['data']["cho"],
    kcal: data['data']["kcal"],
    fat: data['data']["fat"],
    protein: data['data']["protein"],
    sodium: data['data']["sodium"],
    imageUrl: data['data']["imageUrl"],
  );

  Get.bottomSheet(
    // isScrollControlled: true,
    Container(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: [
          Text(myMenu.mainMenu),
          Text('탄수화물 : ${myMenu.cho}g'),
          Text('지방 : ${myMenu.fat}g'),
          Text('단백질 : ${myMenu.protein}g'),
          Text('나트륨 : ${myMenu.sodium}mg'),
          Text('등등..')
          // 디자인 협의 해야될듯
        ],
      ),
    ),
  );
}