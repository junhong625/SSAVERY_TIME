// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

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
    this.isAdmin,
    required this.authorityDtoSet,
  });

  int userIdx;
  String userName;
  String userEmail;
  int trackCode;
  int regionCode;
  int exp;
  int mileage;
  dynamic isAdmin;
  List<AuthorityDtoSet> authorityDtoSet;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userIdx: json["userIdx"],
        userName: json["userName"],
        userEmail: json["userEmail"],
        trackCode: json["trackCode"],
        regionCode: json["regionCode"],
        exp: json["exp"],
        mileage: json["mileage"],
        isAdmin: json["isAdmin"],
        authorityDtoSet: List<AuthorityDtoSet>.from(
            json["authorityDtoSet"].map((x) => AuthorityDtoSet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userIdx": userIdx,
        "userName": userName,
        "userEmail": userEmail,
        "trackCode": trackCode,
        "regionCode": regionCode,
        "exp": exp,
        "mileage": mileage,
        "isAdmin": isAdmin,
        "authorityDtoSet":
            List<dynamic>.from(authorityDtoSet.map((x) => x.toJson())),
      };
}

class AuthorityDtoSet {
  AuthorityDtoSet({
    required this.authorityName,
  });

  String authorityName;

  factory AuthorityDtoSet.fromRawJson(String str) =>
      AuthorityDtoSet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthorityDtoSet.fromJson(Map<String, dynamic> json) =>
      AuthorityDtoSet(
        authorityName: json["authorityName"],
      );

  Map<String, dynamic> toJson() => {
        "authorityName": authorityName,
      };
}
