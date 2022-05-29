class PharmacyModel {
  String? name;
  String? address;
  String? email;
  String? phone;
  String? image;
  String? open;
  String? close;
  String? uId;
  dynamic latitude;
  dynamic longitude;
  dynamic drugsuid;

  PharmacyModel({
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.image,
    required this.open,
    required this.close,
    required this.uId,
    required this.longitude,
    required this.latitude,
    required this.drugsuid,
  });
  PharmacyModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    open = json['open'];
    close = json['close'];
    uId = json['uId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    drugsuid = json['drugsuid'];
  }

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'open': open,
      'close': close,
      'drugsuid': drugsuid,
      'uId': uId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
