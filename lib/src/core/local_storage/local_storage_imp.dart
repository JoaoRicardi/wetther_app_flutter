import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weaather_flutter_app/src/core/local_storage/local_storage.dart';

class LocalStorageImp implements ILocalStorage {

  static const String dbPath = "weatherDb";


  @override
  init() {
    try{
      Hive.init(dbPath);

    }catch(err){
      debugPrint("LocalStorageImp:init err:$err");
    }
  }

  @override
  T? storeItem<T>(String dbName, T item, String key) {
    try{
      var box = Hive.box<T>(dbName);
      box.put(key, item);

      return box.get(key);

    }catch(err){
      debugPrint("LocalStorageImp:storeItem err:$err");
      return null;
    }
  }

  @override
  T? getItem<T>(String dbName, String key) {
    try{
      var box = Hive.box<T>(dbName);

      return box.get(key);
    }catch(err){

      debugPrint("LocalStorageImp:storeItem err:$err");
      return null;
    }
  }




}