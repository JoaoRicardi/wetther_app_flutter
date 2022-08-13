import 'package:hive/hive.dart';

///Item que ficará salvo na cities com itens cacheados em caso de falta de conexao
///e para atualizar o app novamente
part 'city_model.g.dart';

@HiveType(typeId: 0)
class CityModel extends HiveObject {

  @HiveField(0)
  String cityName;

  @HiveField(1)
  int temp;

  @HiveField(2)
  int tempMax;

  @HiveField(3)
  int tempMin;

  @HiveField(4)
  String caption;

  CityModel({
    required this.cityName,
    required this.tempMax,
    required this.temp,
    required this.caption,
    required this.tempMin
  });
}
