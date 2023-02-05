import 'dart:convert';

Map<String, List<Menu>> menuFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Menu>>(k, List<Menu>.from(v.map((x) => Menu.fromJson(x)))));

String menuToJson(Map<String, List<Menu>> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))));

class Menu {
  Menu({
    required this.kcal,
    required this.mainMenu,
    required this.imageUrl,
    required this.sideMenu,
    required this.id,
  });

  int kcal;
  String mainMenu;
  String imageUrl;
  String sideMenu;
  int id;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    kcal: json["kcal"],
    mainMenu: json["main_menu"],
    imageUrl: json["image_url"],
    sideMenu: json["side_menu"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "kcal": kcal,
    "main_menu": mainMenu,
    "image_url": imageUrl,
    "side_menu": sideMenu,
    "id": id,
  };
}