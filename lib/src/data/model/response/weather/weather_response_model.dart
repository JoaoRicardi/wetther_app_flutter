import 'package:weaather_flutter_app/src/data/model/response/weather/weather_coordinates_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_description_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_main_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_model_sys.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_wind_model.dart';

class WeatherResponseModel {
  final String? name;//"name": "London",
  final String? base;// "base": "stations",
  final double? visibility;//"visibility": 10000,
  final int? dt;//"dt": 1660244954,

  final WeatherCordinatesModel? coordinates;
  final List<WeatherDescriptionModel> description;
  final WeatherMainModel? values;
  final WeatherModelWind? wind;
  final WeatherModelSys? sys;

  WeatherResponseModel({
    this.name,
    this.base,
    this.visibility,
    this.dt,
    this.coordinates,
    this.description = const [],
    this.values,
    this.wind,
    this.sys
  });

  static WeatherResponseModel? fromJson(Map<String, dynamic>? json){
    try{
      if(json != null) {
        return WeatherResponseModel(
            name: json["name"],
            base: json["base"],
            dt: json["dt"],
            visibility: json["visibility"],
            coordinates: WeatherCordinatesModel.fromJson(json["coord"]),
            description: WeatherDescriptionModel.fromJsonList(json["weather"]),
            sys: WeatherModelSys.fromJson(json["sys"]),
            values: WeatherMainModel.fromJson(json["main"]),
            wind: WeatherModelWind.fromJson(json["wind"])
        );
      }
      return null;
    }catch(err){
      return null;
    }
  }

}