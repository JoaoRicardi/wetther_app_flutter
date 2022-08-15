import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weaather_flutter_app/src/core/error/custom_exception.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/data/repository/cities/cities_repository_imp.dart';
import 'package:weaather_flutter_app/src/domain/repository/cities/cities_repository.dart';

import '../../utils/mock/core/core_mock.dart';
import '../../utils/params/cities_params.dart';
import '../../utils/utils.dart';

void main(){
  setUpAll((){
    TestUtils.setUpAllTests();
  });

  String tableName = "cities";
  String citiesKey = "users_storage_cities";

  group("test getting storage cities from local",(){

    var localStorage = LocalStorageMock();
    ICitiesRepository citiesRepository = CitiesRepositoryImp(localStorage);

    var mockResult = CitiesParams.localCities;

    test('get cities from local db with not empty return', (){
      when(( ) => localStorage.getItem<CityModel>(tableName, citiesKey))
          .thenAnswer((invocation) => mockResult);


      var listResult = citiesRepository.getStorageCities();

      expect(listResult?.length, mockResult.length);
      expect(listResult![0].cityName, mockResult[0].cityName);
      expect(listResult[1].cityName, mockResult[1].cityName);

    });

    test('get cities from local db with empty return', (){
      when(( ) => localStorage.getItem<CityModel>(tableName, citiesKey))
          .thenAnswer((invocation) => []);


      var listResult = citiesRepository.getStorageCities();

      expect(listResult?.isEmpty, true);
    });

    test('get cities from local db with empty return', (){
      when(( ) => localStorage.getItem<CityModel>(tableName, citiesKey))
          .thenThrow(CustomException(message: "Error"));



      expect(() => citiesRepository.getStorageCities(), throwsA(isA<CustomException>()));
    });
  });
}