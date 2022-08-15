
import 'package:mocktail/mocktail.dart';
import 'package:weaather_flutter_app/src/domain/repository/cities/cities_repository.dart';
import 'package:weaather_flutter_app/src/domain/repository/weather/weather_repository.dart';

class CitiesRepositoryMock extends Mock implements ICitiesRepository{}
class WeatherRepositoryMock extends Mock implements IWeatherRepository{}