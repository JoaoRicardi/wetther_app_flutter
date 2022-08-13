import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';
import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor.dart';
import 'package:weaather_flutter_app/src/domain/repository/cities/cities_repository.dart';
import 'package:weaather_flutter_app/src/domain/repository/weather/weather_repository.dart';

class HomeInteractorImp implements IHomeInteractor {

  final ICitiesRepository _citiesRepository;
  final IWeatherRepository _weatherRepository;

  HomeInteractorImp(this._citiesRepository, this._weatherRepository);

  @override
  Future<List<CityModel>?> getUsersSavedLocations() async  {
    try{
      var res = _citiesRepository.getStorageCities();

      return res;
    }catch(err){
      //lidar com erros
      return null;
    }
  }


  @override
  Future<List<CityModel>?> addCity(CityModel model) async  {
    try{
      return _citiesRepository.addCityToStorage(model);
    }catch(err){
      //lidar com erros
      return null;
    }
  }

  @override
  Future<WeatherResponseModel?> getWeather(String city) async {
    try{
      var res = await _weatherRepository.getWeather(city);

      if(res.isSuccess()){
        return WeatherResponseModel.fromJson(res.data);
      }

    }catch(err){
      debugPrint("HomeInteractorImp:getWeather  err:$err");
      return null;
    }
    return null;

  }
}