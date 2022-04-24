import 'dart:ffi';

class ArticlesModel {
  String? title;
  String? image;
  String? body;
  Array? doo;

  ArticlesModel({
    required this.title,
    required this.image,
    required this.body,
    required this.doo,
  });

  ArticlesModel.fromjson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    body = json['body'];
    doo = json['doo'];
  }
}
