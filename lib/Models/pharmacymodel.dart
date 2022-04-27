class PharmacyModel {
  String? name;
  String? address;
  String? email;
  String? phone;
  String? image;
  String? open;
  String? close;
  String? uId;

  PharmacyModel({
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.image,
    required this.open,
    required this.close,
    required this.uId,
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
  }
}
