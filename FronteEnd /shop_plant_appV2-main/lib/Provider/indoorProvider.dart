import 'package:flutter/material.dart';

import '../Api/server.dart';
import '../model/indoormodel.dart';

class indoorProvider extends ChangeNotifier {
  late List<indoormodel> listofIndoorplants;

  bool loadingState = false;
  getAllIndoorPlants(List<indoormodel> listofPlants) async {
    loadingState = true;
    listofIndoorplants = (await getApiIndoor(listofPlants));
    loadingState = false;
    notifyListeners();
  }
}
