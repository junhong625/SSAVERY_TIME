import 'dart:convert';

class User {
  User({
    required this.userIdx,
    required this.userName,
    required this.userEmail,
    required this.trackCode,
    required this.regionCode,
    required this.exp,
    required this.mileage,
    required this.isAdmin,
    required this.userImg,
  });

  int userIdx;
  String userName;
  String userEmail;
  int trackCode;
  int regionCode;
  int exp;
  int mileage;
  int isAdmin;
  String userImg;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userIdx: json["id"],
        userName: json["userName"],
        userEmail: json["userEmail"],
        trackCode: json["trackCode"],
        regionCode: json["regionCode"],
        exp: json["exp"],
        mileage: json["mileage"],
        isAdmin: json["isAdmin"] ?? 0,
        userImg: json["userImg"],
      );

  Map<String, dynamic> toJson() => {
        "id": userIdx,
        "userName": userName,
        "userEmail": userEmail,
        "trackCode": trackCode,
        "regionCode": regionCode,
        "exp": exp,
        "mileage": mileage,
        "isAdmin": isAdmin,
        "userImg": userImg,
      };
}
