import 'package:flutter/material.dart';
import 'package:minip/Api/Server.dart';
import 'package:minip/model/PostBus.dart';
class FoodAdditivePeovider extends ChangeNotifier{
  List<PostBus> lsitofbooks;

  bool loadingState = false;
  getALLAdditive(List<PostBus> listofModelCLASS) async {
    loadingState = true;
    lsitofbooks = (await getApiFoodAdditive(listofModelCLASS));
    loadingState = false;
    notifyListeners();
  }
}