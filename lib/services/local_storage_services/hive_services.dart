import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class HiveServices{

  /// saving data locally using hive
  static Future<void> saveToHive ({required String boxName, required String modelName, required var jsonData}) async {
    try{
      await Hive.openBox(boxName);
      var box =  Hive.box(boxName);
      await box.put(modelName, json.encode(jsonData));
      debugPrint("\n Save the data in hive successfully!\n");
    }catch(error){
      debugPrint("\nError while saving hive data : $error\n");
    }

  }

  /// fetching data from local (hive data)
  static Future<dynamic> fetchHiveData({required String boxName, required String modelName,}) async {
    try {
      await Hive.openBox(boxName);
      var box = Hive.box(boxName);
      var data =await box.get(modelName);

      if(data != null){
        if(data is String){
          var decodedData = jsonDecode(data);
          debugPrint("\nData fetched successful: $decodedData\n");
          return decodedData;
        }
        else if(data is Map<String, dynamic>){
          debugPrint("\nData fetched successful (Already Map): $data\n");
          return data; // Directly return if it's already a Map
        }
        else{
          return;
        }
      }
      return null;

    } catch (error) {
      debugPrint("Error while retrieving from Hive: $error");
      return;
    }

  }


}