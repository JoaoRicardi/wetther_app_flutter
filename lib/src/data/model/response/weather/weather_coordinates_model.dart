class WeatherCordinatesModel {
  final double? lon;
  final double? lat;

  // "lon": -0.1257,
  // "lat": 51.5085

  WeatherCordinatesModel({this.lon, this.lat});

  WeatherCordinatesModel.empty()
      : lon = null,
        lat = null;

  static WeatherCordinatesModel? fromJson(Map<String,dynamic>? json){
    try{
      if(json != null){
        return WeatherCordinatesModel(
          lat: json["lat"],
          lon: json["lon"]
        );
      }

      return null;

    }catch(err){
      return null;
    }
  }
}
