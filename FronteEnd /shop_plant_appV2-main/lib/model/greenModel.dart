class greenModel {
  String? title;
  String? discription;
  String? price;
  String? height;
  String? image;
  String? temprature;
  String? pot;

  greenModel({
    required this.title,
    required this.discription,
    required this.price,
    required this.height,
    required this.image,
    required this.temprature,
    required this.pot,
  });
  greenModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    discription = json['discription'];
    price = json['price'];
    height = json['height'];
    image = json['image'];
    temprature = json['temprature'];
    pot = json['pot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['price'] = this.price;

    data['height'] = this.height;
    data['image'] = this.image;
    data['temprature'] = this.height;
    data['image'] = this.image;

    return data;
  }
}
