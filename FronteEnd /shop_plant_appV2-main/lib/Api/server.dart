import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

import '../model/FloweringModel.dart';
import '../model/greenModel.dart';
import '../model/indoormodel.dart';

Future<List<greenModel>> getApigreen(List<greenModel> model) async {
  try {
    final resp =
        await http.get(Uri.parse("https://greenapi2020.herokuapp.com/green"));
    final body = json.decode(resp.body);
    if (resp.statusCode == 200) {
      for (Map<String, dynamic> item in body) {
        model.add(greenModel.fromJson(item));
      }
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return model;
}

Future<List<indoormodel>> getApiIndoor(List<indoormodel> model) async {
  try {
    final resp =
        await http.get(Uri.parse("https://indoorapi.herokuapp.com/indoor"));
    final body = json.decode(resp.body);
    if (resp.statusCode == 200) {
      for (Map<String, dynamic> item in body) {
        model.add(indoormodel.fromJson(item));
      }
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return model;
}

Future<List<FloweringModel>> getApiFlowering(List<FloweringModel> model) async {
  try {
    final resp = await http
        .get(Uri.parse("https://floweringapi.herokuapp.com/flowering"));
    final body = json.decode(resp.body);
    if (resp.statusCode == 200) {
      for (Map<String, dynamic> item in body) {
        model.add(FloweringModel.fromJson(item));
      }
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return model;
}
