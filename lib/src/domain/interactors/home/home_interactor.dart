import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';

abstract class IHomeInteractor{
  Future<List<CityModel>?> getUsersSavedLocations();

  Future<List<CityModel>?> addCity(CityModel model);
}