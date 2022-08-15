import 'package:flutter_test/flutter_test.dart';
import 'package:weaather_flutter_app/src/data/model/response/http_response.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_coordinates_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_description_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_main_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_model_sys.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_wind_model.dart';

class MockWeatherResponseModel extends Fake implements WeatherResponseModel{}
class MockHttpResponseModel extends Fake implements HttpResponse{}

class WeatherMocks {

  static Map<String, dynamic> mapResponse = {
    "name": "Sao Paulo, name",
    "base": "Sao Paulo base",
    "dt": 151351,
    "visibility": 100,
    "dt_txt": "2022-08-18 10:22",
    "coord": {
      "lat": 15.545,
      "lon": 16.22
    },
    "sys": {
      "type": 1,
      "country": "Br",
      "id": 2,
      "sunrise": 3,
      "sunset": 4
    },
    "main": {
      "feels_like": 202,
      "humidity": 50,
      "temp_max": 201,
      "temp_min": 199,
      "temp": 200
    },
    "wind": {
      "deg": 21,
      "speed": 22.02
    },
    "weather": [
      {
        "id": 1,
        "description": "desc 1",
        "main": "main 1"
      },
      {
        "id": 2,
        "description": "desc 2",
        "main": "main 2"
      },
    ]
  };

  static WeatherResponseModel successResponse = WeatherResponseModel(
    visibility: 100,
    dt: 151351,
    base: "Sao Paulo base",
    dtTxt: "dtTxt",
    name: "Sao Paulo, name",
    values: mainModel,
    sys: sysModel,
    coordinates: cordinatesModel,
    wind: windModel,
    description: [
      descriptionModel("descricao 1"),
      descriptionModel("descricao 2"),
      descriptionModel("descricao 3"),
    ]
  );

  static WeatherMainModel mainModel = WeatherMainModel(
      temp: 200, min: 199, max: 201, humidity: 50, feelsLike: 202);

  static WeatherModelSys sysModel =
      WeatherModelSys(type: 1, id: 2, sunset: 3, sunrise: 4, country: "Br");


  static WeatherCordinatesModel cordinatesModel = WeatherCordinatesModel(
    lon: 15.545,
    lat: 16.22
  );

  static WeatherModelWind windModel = WeatherModelWind(
      speed: 22.02,
      deg: 21
  );

  static WeatherDescriptionModel descriptionModel(String desc) => WeatherDescriptionModel(
    description: desc,
    id: 1,
    main: "main test"
  );
}
