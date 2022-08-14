import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:weaather_flutter_app/src/core/base/controller/base_controller.dart';
import 'package:weaather_flutter_app/src/core/error/controller/error_controller.dart';
import 'package:weaather_flutter_app/src/core/error/custom_exception.dart';
import 'package:weaather_flutter_app/src/data/mappers/weather/city_weather_mapper.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController extends BaseController with Store {

  final IHomeInteractor _homeInteractor;

  _HomeController(this._homeInteractor);

  @observable
  List<CityModel>? storageCities;

  ErrorController errorController = ErrorController();

  @action
  init() {
    try {
      errorController.resetErrors();
      isLoading = true;
      var saved = _homeInteractor.getUsersSavedLocations();

      if(saved != null){
        _sortAndUpdateList(saved);
      }

    }catch(err){
      debugPrint(err.toString());
      errorController.handleException(err);
    }
    finally{
      isLoading = false;
    }
  }

  @action
  addCityNameToList(String cityName) async {

    try{

      //criando o init state da cidade para loading individual
      var emptyCity = CityModel(
          cityName: cityName,
          tempMax: 0,
          temp: 0,
          caption: "",
          tempMin: 0,
          fullfilledValue: false,
          lastUpdate: ""
      );

      //validar se a cidade ja esta na lista de cidades
      var cityByName = storageCities?.where((element) => element.cityName == cityName).toList();

      if(cityByName != null && cityByName.isNotEmpty){
        throw CustomException(
          message: "Cidade já esta na lista.",
        );
      }

      //salvando
      storageCities = await _homeInteractor.addCity(emptyCity);

      await _getWeatherForCity(emptyCity);

    }catch(err){
      errorController.handleException(err);
    }
  }


  _getWeatherForCity(CityModel cityModel) async {
    try{
      //pegar os daods iniciais
      var getWeatherForCity = await _homeInteractor.getWeather(cityModel.cityName);

      if(getWeatherForCity != null){
        var cityFromWeather = CityWeatherMapper.fromWeather(getWeatherForCity);

        cityModel.temp = cityFromWeather.temp;
        cityModel.tempMax = cityFromWeather.tempMax;
        cityModel.caption = cityFromWeather.caption;
        cityModel.tempMin = cityFromWeather.tempMin;
        cityModel.fullfilledValue = true;
        cityModel.lastUpdate = cityFromWeather.lastUpdate;
        await cityModel.save();


        var saved = _homeInteractor.getUsersSavedLocations();

        if(saved != null){
          _sortAndUpdateList(saved);
        }
      }

    }catch(err){
      errorController.handleException(err);
    }
  }


  _sortAndUpdateList(List<CityModel> cities){
     cities.sort((a, b) => a.cityName.compareTo(b.cityName));
    storageCities = cities;
  }
}




