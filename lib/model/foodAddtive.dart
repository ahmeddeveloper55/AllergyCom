
class foodAddtive {


  String number;
  String description;
  String category;
  String status;

  foodAddtive({this.number, this.description, this.category, this.status});

  foodAddtive.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    description = json['description'];
    category = json['category'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['description'] = this.description;
    data['category'] = this.category;
    data['status'] = this.status;
    return data;
  }
}