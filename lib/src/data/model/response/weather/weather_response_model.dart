import 'package:intl/intl.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_coordinates_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_description_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_main_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_model_sys.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_wind_model.dart';

class WeatherResponseModel {
  final String? name;
  final String? base;
  final int? visibility;
  final int? dt;
  final String? dtTxt;

  final WeatherCordinatesModel? coordinates;
  final List<WeatherDescriptionModel> description;
  final WeatherMainModel? values;
  final WeatherModelWind? wind;
  final WeatherModelSys? sys;

  late DateTime? dateFromTxt;

  WeatherResponseModel({
    this.name,
    this.base,
    this.visibility,
    this.dt,
    this.coordinates,
    this.description = const [],
    this.values,
    this.wind,
    this.sys,
    this.dtTxt,
  });

  static WeatherResponseModel? fromJson(Map<String, dynamic>? json){
    try{
      if(json != null) {
        var weather = WeatherResponseModel(
            name: json["name"],
            base: json["base"],
            dt: json["dt"],
            visibility: json["visibility"],
            dtTxt: json["dt_txt"],
            coordinates: WeatherCordinatesModel.fromJson(json["coord"]),
            description: WeatherDescriptionModel.fromJsonList(json["weather"]),
            sys: WeatherModelSys.fromJson(json["sys"]),
            values: WeatherMainModel.fromJson(json["main"]),
            wind: WeatherModelWind.fromJson(json["wind"])
        );

        if(json["dt_txt"] != null){
          weather.dateFromTxt = weather.formatDate(json["dt_txt"]);
        }

        return weather;
      }
      return null;
    }catch(err){
      return null;
    }
  }

  static List<WeatherResponseModel>? fromJsonList(List<dynamic> json){
    List<WeatherResponseModel> list = [];

    try{
      for (var element in json) {
        var res = WeatherResponseModel.fromJson(element);

        if(res != null) {
          list.add(res);
        }
      }

      return list;

    }catch(err){
      print(err);
      return null;
    }
  }


  DateTime? formatDate(String txt){
    String format = "yyyy-MM-dd hh:mm";
    DateFormat formater = DateFormat(format);

    return formater.parse(txt);


  }

}