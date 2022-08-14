import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/error/custom_exception.dart';
import 'package:weaather_flutter_app/src/core/error/custom_exception_type.dart';
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
  List<CityModel>? getUsersSavedLocations() {
    try {
      return _citiesRepository.getStorageCities();
    } catch (err) {
      if (err is CustomException) {
        rethrow;
      } else {
        throw CustomException(
            type: CustomExceptionTypes.localdb,
            error: err,
            message: "Erro ao pegar cidades salvas.Tente novamente");
      }
    }
  }

  @override
  Future<List<CityModel>?> addCity(CityModel model) async {
    try {
      return _citiesRepository.addCityToStorage(model);
    } catch (err) {
      //lidar com erros
      return null;
    }
  }

  @override
  Future<WeatherResponseModel?> getWeather(String city) async {
    try {
      var res = await _weatherRepository.getWeather(city);

      if (res.isSuccess()) {
        return WeatherResponseModel.fromJson(res.data);
      }
      else{
        throw CustomException(
          message: "Houve um erro de comunicao com o servidor. Tente novamente mais tarde."
        );
      }
    } catch (err) {
      throw CustomException(message: "Houve um erro ao pegar dados");
    }
  }
}
