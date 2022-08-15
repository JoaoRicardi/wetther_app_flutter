class WeatherDescriptionModel {
  final int? id;
  final String? main;
  final String? description;

  WeatherDescriptionModel({this.id, this.main, this.description});

  WeatherDescriptionModel.empty(): id = null, main = null, description = null;

  static WeatherDescriptionModel? fromJson(Map<String, dynamic>? json){
    try{
      if(json != null){
        return WeatherDescriptionModel(
          id: json["id"],
          description: json["description"],
          main: json["main"]
        );
      }

      return WeatherDescriptionModel.empty();
    }catch(err){
      return null;
    }
  }

  static List<WeatherDescriptionModel> fromJsonList(List<dynamic>? json){
    try{
      List<WeatherDescriptionModel> descriptions = [];

      json?.forEach((element) {
        var item = WeatherDescriptionModel.fromJson(element);

        if(item != null) {
          descriptions.add(item);
        };
      });

      return descriptions;
    }catch(err){
      return [];
    }
  }
}