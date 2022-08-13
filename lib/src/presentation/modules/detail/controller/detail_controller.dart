import 'package:mobx/mobx.dart';
import 'package:weaather_flutter_app/src/core/base/controller/base_controller.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';
import 'package:weaather_flutter_app/src/domain/interactors/detail/detail_interactor.dart';

part 'detail_controller.g.dart';

class DetailController = _DetailController with _$DetailController;

abstract class _DetailController extends BaseController with Store {

  final IDetailInteractor _detailInteractor;

  _DetailController(this._detailInteractor);

  @observable
  List<WeatherResponseModel>? values;

  @observable
  CityModel? model;

  @action
  init(CityModel model) async {
    this.model = model;
    values = await _detailInteractor.getDetails(model.cityName);
  }
}