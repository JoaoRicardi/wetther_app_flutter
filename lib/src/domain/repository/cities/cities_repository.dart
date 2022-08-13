import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';

abstract class ICitiesRepository {
  Future<List<CityModel>?> getStorageCities();

  Future<List<CityModel>?> addCityToStorage(CityModel model) ;
}