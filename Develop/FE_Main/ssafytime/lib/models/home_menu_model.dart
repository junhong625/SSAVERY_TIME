import 'dart:convert';

class HomeMenu {
  HomeMenu({
    required this.data,
    required this.message,
    required this.isSuccess,
    required this.status,
  });

  List<Data> data;
  String message;
  bool isSuccess;
  String status;

  factory HomeMenu.fromRawJson(String str) =>
      HomeMenu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeMenu.fromJson(Map<String, dynamic> json) => HomeMenu(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        message: json["message"],
        isSuccess: json["isSuccess"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "isSuccess": isSuccess,
        "status": status,
      };
}

class Data {
  Data({
    required this.id,
    required this.mainMenu,
    required this.sideMenu,
    required this.kcal,
    required this.imageUrl,
  });

  int id;
  String mainMenu;
  List<String> sideMenu;
  int kcal;
  String imageUrl;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        mainMenu: json["mainMenu"],
        sideMenu: List<String>.from(json["sideMenu"].map((x) => x)),
        kcal: json["kcal"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mainMenu": mainMenu,
        "sideMenu": List<dynamic>.from(sideMenu.map((x) => x)),
        "kcal": kcal,
        "imageUrl": imageUrl,
      };
}
