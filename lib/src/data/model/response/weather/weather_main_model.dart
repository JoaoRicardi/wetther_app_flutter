class WeatherMainModel {
  final double? temp;
  final double? feelsLike;
  final double? min;
  final double? max;
  final double? humidity;

  WeatherMainModel({this.temp, this.feelsLike, this.min, this.max, this.humidity});

  WeatherMainModel.empty() :
      temp = null, feelsLike =  null, min = null, max = null, humidity = null;

  static WeatherMainModel? fromJson(Map<String, dynamic>? json){
    try{
      if(json != null){
        return WeatherMainModel(
          feelsLike: json["feels_like"],
          humidity: json["temp_min"],
          max: json["temp_max"],
          min: json["humidity"],
          temp: json["temp"]
        );
      }

      return WeatherMainModel.empty();

    }catch(err){
      return null;
    }
  }

}
