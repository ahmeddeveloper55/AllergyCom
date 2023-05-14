import 'package:flutter/material.dart';

class ModelRecipe{
  String title;
   String url;
   String imgUrl;
   String des;

  ModelRecipe(this.title, this.url, this.imgUrl, this.des);
  ModelRecipe.fromJson(Map<String,dynamic> json){
    title=json['title'] ?? "";
    url=json['url'] ?? "";
    imgUrl=json['img'] ?? "";
    des=json['des'] ?? "";
  }
}