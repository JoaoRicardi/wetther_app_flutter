import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/local_storage/local_storage.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/domain/repository/cities/cities_repository.dart';

class CitiesRepositoryImp implements ICitiesRepository {

  final ILocalStorage _localStorage;

  CitiesRepositoryImp(this._localStorage);

  static const String tableName = "cities";
  static const String citiesKey = "users_storage_cities";


  @override
  List<CityModel>? getStorageCities() {
    try{
      return _localStorage.getItem<List<CityModel>>(tableName, citiesKey);
    }catch(err){
      debugPrint("CitiesRepositoryImp:addCityToStorage err:$err");
      return null;
    }
  }

  @override
  List<CityModel>? addCityToStorage(CityModel model) {
    try{
      var currentCities = _localStorage.getItem<List<CityModel>>(tableName, citiesKey) ?? [];

      currentCities.add(model);

      var addTo = _localStorage.storeItem(tableName, currentCities, citiesKey);

      if(addTo != null){
        return currentCities;
      }

      return null;
    }catch(err){
      debugPrint("CitiesRepositoryImp:addCityToStorage err:$err");
      return null;
    }
  }

}