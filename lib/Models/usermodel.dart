import 'package:flutter/material.dart';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;
  String? uId;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
    required this.uId,
  });

  UserModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    uId = json['uId'];
  }

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'uId': uId,
    };
  }
}
