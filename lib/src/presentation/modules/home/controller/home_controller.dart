import 'package:mobx/mobx.dart';
import 'package:weaather_flutter_app/src/core/base/controller/base_controller.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
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

    var getList = await _homeInteractor.getUsersSavedLocations();
    print(getList);

    storageCities = getList;

  }

  @action
  addCityModel() async {
    var res = await _homeInteractor.addCity(CityModel(
        cityName: "Sao Paulo",
        tempMax: 27,
        temp: 24,
        caption: "Estamos em sp",
        tempMin: 22
    )
    );


    storageCities = res;
  }

}




