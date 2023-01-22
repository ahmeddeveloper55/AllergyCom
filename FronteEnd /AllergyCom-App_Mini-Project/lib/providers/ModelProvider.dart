


import 'package:flutter/cupertino.dart';
import 'package:minip/Api/Server.dart';
import 'package:minip/model/ModelClass.dart';
import 'package:minip/model/ModelRecipe.dart';


class ModelProvider extends ChangeNotifier {
  List<ModelClass> lsitoftips;
  List<ModelRecipe> lsitofRecipe;

  bool loadingState = false;

  getALLTips(List<ModelClass> listofModelCLASS) async {
    loadingState = true;
    lsitoftips = (await getApiReq(listofModelCLASS));
    loadingState = false;
    notifyListeners();
  }


}