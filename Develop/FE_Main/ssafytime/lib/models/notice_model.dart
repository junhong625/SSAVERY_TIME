import 'dart:convert';

class NoticeList {
  NoticeList({
    this.data,
  });

  List<Notice>? data;

  factory NoticeList.fromRawJson(String str) =>
      NoticeList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NoticeList.fromJson(Map<String, dynamic> json) => NoticeList(
        data: json["data"] == null
            ? []
            : List<Notice>.from(json["data"]!.map((x) => Notice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Notice {
  Notice({
    this.id,
    this.title,
    this.category,
    this.contentUrl,
    this.createDateTime,
  });

  int? id;
  String? title;
  String? category;
  String? contentUrl;
  DateTime? createDateTime;

  factory Notice.fromRawJson(String str) => Notice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        contentUrl: json["contentUrl"],
        createDateTime: json["createDateTime"] == null
            ? null
            : DateTime.parse(json["createDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "contentUrl": contentUrl,
        "createDateTime": createDateTime?.toIso8601String(),
      };
}
