import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';

class CityWeatherMapper{

  static CityModel fromWetaher(WeatherResponseModel model){

    var temp = model.values;

    var description = "";

    if(model.description.isNotEmpty){
      description = model.description[0].description ?? "";
    }

    return CityModel(
        cityName: model.name ?? "",
        tempMax: temp?.max ?? 0.0,
        temp: temp?.temp ?? 0.0,
        tempMin: temp?.min ?? 0.0,
        caption: description,
    );
  }

}