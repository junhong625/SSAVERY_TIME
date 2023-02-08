import 'dart:convert';

class HomeMenu {
  HomeMenu({
    required this.data,
    required this.message,
    required this.isSuccess,
    required this.status,
  });

  Data data;
  String message;
  bool isSuccess;
  String status;

  factory HomeMenu.fromRawJson(String str) =>
      HomeMenu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeMenu.fromJson(Map<String, dynamic> json) => HomeMenu(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        isSuccess: json["isSuccess"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "isSuccess": isSuccess,
        "status": status,
      };
}

class Data {
  Data({
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

  int region;
  String course;
  String mainMenu;
  List<String> sideMenu;
  int cho;
  int kcal;
  int fat;
  int protein;
  int sodium;
  String imageUrl;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        region: json["region"],
        course: json["course"],
        mainMenu: json["mainMenu"],
        sideMenu: List<String>.from(json["sideMenu"].map((x) => x)),
        cho: json["cho"],
        kcal: json["kcal"],
        fat: json["fat"],
        protein: json["protein"],
        sodium: json["sodium"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "course": course,
        "mainMenu": mainMenu,
        "sideMenu": List<dynamic>.from(sideMenu.map((x) => x)),
        "cho": cho,
        "kcal": kcal,
        "fat": fat,
        "protein": protein,
        "sodium": sodium,
        "imageUrl": imageUrl,
      };
}
