import 'package:weaather_flutter_app/src/data/model/response/http_response.dart';

abstract class IWeatherRepository {
  Future<HttpResponse> getWeather(String cityName);
}