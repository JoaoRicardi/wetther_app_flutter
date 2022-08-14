import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';

abstract class IHomeInteractor{
  List<CityModel>? getUsersSavedLocations();

  Future<List<CityModel>?> addCity(CityModel model);

  Future<WeatherResponseModel?> getWeather(String city);
}