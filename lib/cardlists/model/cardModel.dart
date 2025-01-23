import 'dart:convert';

List<CardModel> cardModelFromJson(String str) =>
    List<CardModel>.from(json.decode(str).map((x) => CardModel.fromJson(x)));

String cardModelToJson(List<CardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  CardModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
