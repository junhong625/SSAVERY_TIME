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
  });

  int userIdx;
  String userName;
  String userEmail;
  int trackCode;
  int regionCode;
  int exp;
  int mileage;
  int isAdmin;

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
      };
}
