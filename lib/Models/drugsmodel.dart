class DrugsModel {
  String? name;
  dynamic price;
  dynamic quantity;
  String? image;
  String? usage;
  DrugsModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.usage,
  });

  DrugsModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    usage = json['usage'];
  }
}
