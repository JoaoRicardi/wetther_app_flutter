import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';

abstract class ICitiesRepository {
  List<CityModel>? getStorageCities();

  List<CityModel>? addCityToStorage(CityModel model) ;
}