import 'package:flutter/material.dart';

import '../Api/server.dart';
import '../model/greenModel.dart';

class greenProvider extends ChangeNotifier {
  late List<greenModel> listofGreenplants;

  bool loadingState = false;
  getAllGreenPlants(List<greenModel> listofPlants) async {
    loadingState = true;
    listofGreenplants = (await getApigreen(listofPlants));
    loadingState = false;
    notifyListeners();
  }
}
