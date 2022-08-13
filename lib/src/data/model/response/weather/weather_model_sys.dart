class WeatherModelSys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  WeatherModelSys({
    this.type, this.id, this.country, this.sunrise, this.sunset
  });
///"sys": {
//         "type": 2,
//         "id": 268730,
//         "country": "GB",
//         "sunrise": 1660192769,
//         "sunset": 1660246327
//     },

  WeatherModelSys.empty():
        type = null,
        id = null,
        country = "Unknow",
        sunrise = null,
        sunset = null;

  static WeatherModelSys? fromJson(Map<String, dynamic>? json){
    try{
      if(json != null){
        return WeatherModelSys(
          type: json["type"],
          country: json["country"],
          id: json["id"],
          sunrise: json["sunrise"],
          sunset: json["sunset"]
        );
      }

      return WeatherModelSys.empty();

    }catch(err){
      return null;
    }
  }
}