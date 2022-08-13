import 'package:flutter/cupertino.dart';
import 'package:weaather_flutter_app/src/core/client/http_client/http_client.dart';
import 'package:weaather_flutter_app/src/data/model/response/http_response.dart';
import 'package:weaather_flutter_app/src/domain/repository/weather/weather_repository.dart';

class WeatherRepositoryImp implements IWeatherRepository {
  final IHttpClient _client;

  WeatherRepositoryImp(this._client);

  @override
  Future<HttpResponse> getWeather(String cityName) async {
    try {
      var res = await _client.get(
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=710273420e4626139ccd0011d4b0b861");

      return HttpResponse.fromResponse(res.statusCode, data: res.data);

    } on Exception catch (err) {
      debugPrint("WeatherRepositoryImp:getWeather err:$err");
      return HttpResponse.fromException(err);
    }
  }

  @override
  Future<HttpResponse> getCityDetails(String city) async {
    try {
      var res = await _client.get(
          "https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=710273420e4626139ccd0011d4b0b861"
      );

      return HttpResponse.fromResponse(res.statusCode, data: res.data);

    } on Exception catch (err) {
      debugPrint("WeatherRepositoryImp:getCityDetails err:$err");
      return HttpResponse.fromException(err);
    }
  }
}








