import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor.dart';
import 'package:weaather_flutter_app/src/domain/repository/cities/cities_repository.dart';

class HomeInteractorImp implements IHomeInteractor {

  final ICitiesRepository _citiesRepository;

  HomeInteractorImp(this._citiesRepository);

  @override
  Future getUsersSavedLocations() async {
    try{
      return _citiesRepository.getStorageCities();

    }catch(err){
      //lidar com erros
    }
  }

}