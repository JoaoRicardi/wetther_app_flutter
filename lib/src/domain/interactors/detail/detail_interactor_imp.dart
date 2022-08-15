import 'package:weaather_flutter_app/src/core/error/custom_exception.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';
import 'package:weaather_flutter_app/src/domain/interactors/detail/detail_interactor.dart';
import 'package:weaather_flutter_app/src/domain/repository/weather/weather_repository.dart';

class DetailInteractorImp implements IDetailInteractor {

  final IWeatherRepository _weatherRepository;

  DetailInteractorImp(this._weatherRepository);

  @override
  Future<List<WeatherResponseModel>?> getDetails(String city) async {
    try{
      var res = await _weatherRepository.getCityDetails(city);

      if(res.isSuccess()){
        var values = WeatherResponseModel.fromJsonList(res.data["list"]);

        return _filterAvailableList(values ?? []);
      }
      else{
        throw CustomException(message: "Houve um erro de comunicação tente novamente.");
      }

    }catch(err){
      throw CustomException(message: "Houve um erro inesperado tente novamente.");
    }
  }

  List<WeatherResponseModel> _filterAvailableList(List<WeatherResponseModel> list){
    List<WeatherResponseModel> values = [];

    DateTime currentDate = DateTime.now().add(const Duration(days: 1));

    list.map((e) {
      if(e.dateFromTxt != null) {
        if (validateDates(currentDate, e.dateFromTxt!)){

          values.add(e);
          currentDate = currentDate.add(const Duration(days: 1));
        }
      }

    }).toList();

    return values;
  }


  bool validateDates(DateTime currentDate, DateTime value){
    return currentDate.year == value.year
        && currentDate.month == value.month
        && currentDate.day == value.day;
  }
}