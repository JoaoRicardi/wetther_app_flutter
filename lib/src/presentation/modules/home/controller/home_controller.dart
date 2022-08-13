import 'package:mobx/mobx.dart';
import 'package:weaather_flutter_app/src/core/base/controller/base_controller.dart';
import 'package:weaather_flutter_app/src/data/mappers/weather/city_weather_mapper.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';
import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController extends BaseController with Store {

  final IHomeInteractor _homeInteractor;

  _HomeController(this._homeInteractor);

  @observable
  List<CityModel>? storageCities;

  @action
  init() async {
    storageCities = await _homeInteractor.getUsersSavedLocations();
  }

  _addCityModel(WeatherResponseModel model) async {
    var city = CityWeatherMapper.fromWetaher(model);
    storageCities = await _homeInteractor.addCity(city);;
  }

  @action
  getWeatherForCity(String city)async{
    var res = await _homeInteractor.getWeather(city);
    if(res != null){
      _addCityModel(res);
    }
  }

}




