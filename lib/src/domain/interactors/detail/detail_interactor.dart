import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';

abstract class IDetailInteractor{
  Future<List<WeatherResponseModel>?> getDetails(String city);
}