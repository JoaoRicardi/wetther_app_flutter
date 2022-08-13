import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weaather_flutter_app/src/core/local_storage/local_storage.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';

class LocalStorageImp implements ILocalStorage {

  static const String dbPath = "weatherDb";


  @override
  init()async  {
    try{

      var path = await getPath();
      Hive.init(path);
      Hive.registerAdapter(CityModelAdapter());
    }catch(err){
      debugPrint("LocalStorageImp:init err:$err");
    }
  }

  @override
  T? storeItem<T>(String dbName, T item, String key) {
    try{

      var box = Hive.box<T>(dbName);
      box.put(key, item);
      var value = box.get(key);
      box.close();
      return value;

    }catch(err){
      debugPrint("LocalStorageImp:storeItem err:$err");
      return null;
    }
  }

  @override
  Future<T?> getItem<T>(String dbName, String key) async  {
    try{
      var path = await getPath();

      var box = await Hive.openBox<T>(dbName);

      var getValue = box.get(key);
      await box.close();

      return getValue;
    }catch(err){

      debugPrint("LocalStorageImp:storeItem err:$err");
      return null;
    }
  }

  Future<String> getPath() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    return (await Directory(appDocDirectory.path+'/'+'dir').create(recursive: true)).path;
  }

}