import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weaather_flutter_app/src/data/model/response/http_response.dart';
import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor.dart';
import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor_imp.dart';
import 'package:weaather_flutter_app/src/domain/repository/cities/cities_repository.dart';
import 'package:weaather_flutter_app/src/domain/repository/weather/weather_repository.dart';

import '../../utils/mock/repository/repository_mocks.dart';
import '../../utils/mock/response/weather_mocks.dart';
import '../../utils/utils.dart';

void main(){
  setUpAll((){
    TestUtils.setUpAllTests();
  });

  final ICitiesRepository _citiesRepository = CitiesRepositoryMock();
  final IWeatherRepository _weatherRepository = WeatherRepositoryMock();
  
  final IHomeInteractor interactor =  HomeInteractorImp(
      _citiesRepository, 
      _weatherRepository
  );
  
  group('Test get weather method', (){
    
    
    test('Return an valid response', () async {
      var cityName = "São Paulo";
      var response = WeatherMocks.mapResponse;

      when(() =>  _weatherRepository.getWeather(cityName)).thenAnswer((_) async => HttpResponse(200,data: response));

      var res = await interactor.getWeather(cityName);

      expect(res?.name, response["name"]);
      expect(res?.base, response["base"]);
      expect(res?.dt, response["dt"]);
      expect(res?.visibility, response["visibility"]);
      expect(res?.dtTxt, response["dt_txt"]);

    });
  });



}