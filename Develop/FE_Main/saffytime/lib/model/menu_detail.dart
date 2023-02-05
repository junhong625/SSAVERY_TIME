// To parse this JSON data, do
//
//     final menuDetail = menuDetailFromJson(jsonString);

import 'dart:convert';

MenuDetail menuDetailFromJson(String str) => MenuDetail.fromJson(json.decode(str));

String menuDetailToJson(MenuDetail data) => json.encode(data.toJson());

class MenuDetail {
  MenuDetail({
    required this.date,
    required this.region,
    required this.course,
    required this.mainMenu,
    required this.sideMenu,
    required this.cho,
    required this.kcal,
    required this.fat,
    required this.protein,
    required this.sodium,
    required this.imageUrl,
  });

  String date;
  int region;
  String course;
  String mainMenu;
  String sideMenu;
  int cho;
  int kcal;
  int fat;
  int protein;
  int sodium;
  String imageUrl;

  factory MenuDetail.fromJson(Map<String, dynamic> json) => MenuDetail(
    date: json["date"],
    region: json["region"],
    course: json["course"],
    mainMenu: json["mainMenu"],
    sideMenu: json["sideMenu"],
    cho: json["cho"],
    kcal: json["kcal"],
    fat: json["fat"],
    protein: json["protein"],
    sodium: json["sodium"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "region": region,
    "course": course,
    "mainMenu": mainMenu,
    "sideMenu": sideMenu,
    "cho": cho,
    "kcal": kcal,
    "fat": fat,
    "protein": protein,
    "sodium": sodium,
    "imageUrl": imageUrl,
  };
}
