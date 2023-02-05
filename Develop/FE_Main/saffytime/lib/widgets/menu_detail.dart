import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/menu_detail.dart';

void openMenuDetail(int id) async {

  var res = await http.get(Uri.parse('http://i8a602.p.ssafy.io:9090/menu/detail?id=${id}'));
  var data = json.decode(res.body);

  MenuDetail myMenu = MenuDetail(
    date: data["date"],
    region: data["region"],
    course: data["course"],
    mainMenu: data["mainMenu"],
    sideMenu: data["sideMenu"],
    cho: data["cho"],
    kcal: data["kcal"],
    fat: data["fat"],
    protein: data["protein"],
    sodium: data["sodium"],
    imageUrl: data["imageUrl"],
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
          Text(myMenu.sideMenu),
          // 디자인 협의 해야될듯
        ],
      ),
    ),
  );
}