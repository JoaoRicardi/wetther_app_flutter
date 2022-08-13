import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor.dart';
import 'package:weaather_flutter_app/src/domain/repository/cities/cities_repository.dart';

class HomeInteractorImp implements IHomeInteractor {

  final ICitiesRepository _citiesRepository;

  HomeInteractorImp(this._citiesRepository);

  @override
  Future<List<CityModel>?> getUsersSavedLocations() async  {
    try{
      var res = await _citiesRepository.getStorageCities();

      print("interactior res: $res");

      return res;
    }catch(err){
      //lidar com erros
      return null;
    }
  }


  @override
  Future<List<CityModel>?> addCity(CityModel model)async  {
    try{
      return await _citiesRepository.addCityToStorage(model);

    }catch(err){
      //lidar com erros
      return null;
    }
  }
}