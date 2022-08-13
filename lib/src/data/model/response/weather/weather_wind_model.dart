class WeatherModelWind {
  final double? speed;
  final double? deg;

  WeatherModelWind({this.speed, this.deg});

  WeatherModelWind.empty():
        speed = null,
        deg = null;


  static WeatherModelWind? fromJson(Map<String, dynamic>? json){
    try{
      if(json != null){
        return WeatherModelWind(
          deg: json["deg"],
          speed: json["speed"]
        );
      }

      return WeatherModelWind.empty();

    }catch(err){
      return null;
    }
  }

}