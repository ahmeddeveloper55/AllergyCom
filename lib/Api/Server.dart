




import 'dart:convert';
import 'dart:developer';

import 'package:minip/model/ModelClass.dart';
import 'package:minip/model/ModelRecipe.dart';

import 'package:http/http.dart' as http;
import 'package:minip/model/PostBus.dart';

Future<List<ModelClass>> getApiReq (List<ModelClass> model) async {
   try {
      final resp = await http.get(Uri.parse("https://allergycomapifordeployment-production.up.railway.app/api/Tips/tips"));
      final body = json.decode(resp.body);
      if(resp.statusCode == 200){
            for(Map item in body){
               model.add(ModelClass.fromJson(item));
            }
         }else{
         log("error");
      }
   } catch (e) {
      log(e.toString());
   }
return model;
}
Future<List<ModelRecipe>> getApiReqRecipe (List<ModelRecipe> modelR) async {
   try {
      final resp = await http.get(Uri.parse("https://allergycomapifordeployment-production.up.railway.app/api/Recipes/recipe"));
      final body = json.decode(resp.body);
      if(resp.statusCode == 200){
         for(Map item in body){
            modelR.add(ModelRecipe.fromJson(item));
         }
      }else{
         log("error");
      }
   } catch (e) {
      log(e.toString());
   }
   return modelR;
}
Future<List<PostBus>> getApiFoodAdditive (List<PostBus> modelR) async {
   try {
      final resp = await http.get(Uri.parse("https://allergycomapifordeployment-production.up.railway.app/api/foodAdditive/Additive"));
      final body = json.decode(resp.body);
      if(resp.statusCode == 200){
         for(Map item in body){
            modelR.add(PostBus.fromJson(item));
         }
      }else{
         log("error");
      }
   } catch (e) {
      log(e.toString());
   }
   return modelR;
}