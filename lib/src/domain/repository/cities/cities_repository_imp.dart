import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/error/custom_exception.dart';
import 'package:weaather_flutter_app/src/core/error/custom_exception_type.dart';
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
    try {
      return _localStorage.getItem<CityModel>(tableName, citiesKey);
    } on Exception catch (err) {
      throw CustomException(
          message: "Erro ao ler banco local.",
          error: err,
          type: CustomExceptionTypes.localdb);
    }
  }

  @override
  List<CityModel>? addCityToStorage(CityModel model) {
    try {
      return _localStorage.storeItem(tableName, model);
    } catch (err) {
      debugPrint("CitiesRepositoryImp:addCityToStorage err:$err");
      return null;
    }
  }
}
