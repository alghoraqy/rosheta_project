class DrugsModel {
  String? name;
  dynamic price;
  dynamic quantity;
  String? image;
  String? usage;
  int? uid;
  DrugsModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.usage,
    required this.uid,
  });

  DrugsModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    usage = json['usage'];
    uid = json['uid'];
  }

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
      'usage': usage,
      'uid': uid,
    };
  }
}
