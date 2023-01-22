import 'package:flutter/material.dart';

class Nutrient{

   String prediction;
  Nutrient({this.prediction});




  Nutrient.fromJson(Map<dynamic,dynamic> json){
    prediction = json['Prediction'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Prediction'] = this.prediction;

    return data;
  }

}