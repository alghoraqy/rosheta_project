import 'package:flutter/material.dart';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;
  String? uId;
  dynamic latitude;
  dynamic longitude;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
    required this.uId,
    required this.longitude,
    required this.latitude
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    uId = json['uId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'uId': uId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
