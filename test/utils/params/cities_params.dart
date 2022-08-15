import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';

class CitiesParams {
  static List<CityModel> localCities = [
    CityModel(
      cityName: "Sao Paulo",
      fullfilledValue: true,
      lastUpdate: "today",
      temp: 280,
      caption: "cloud",
      tempMax: 280.0,
      tempMin: 266.0
    ),
    CityModel(
        cityName: "Melborne",
        fullfilledValue: true,
        lastUpdate: "today",
        temp: 280,
        caption: "cloud",
        tempMax: 280.0,
        tempMin: 266.0
    )
  ];
}