import 'package:get_it/get_it.dart';
import 'package:weaather_flutter_app/src/core/client/http_client/http_client.dart';
import 'package:weaather_flutter_app/src/core/client/http_client/http_client_imp.dart';
import 'package:weaather_flutter_app/src/core/di/di.dart';
import 'package:weaather_flutter_app/src/core/local_storage/local_storage.dart';
import 'package:weaather_flutter_app/src/core/local_storage/local_storage_imp.dart';
import 'package:weaather_flutter_app/src/core/navigation/navigation_handler.dart';
import 'package:weaather_flutter_app/src/core/navigation/navigation_handler_imp.dart';
import 'package:weaather_flutter_app/src/data/repository/cities/cities_repository_imp.dart';
import 'package:weaather_flutter_app/src/data/repository/weather/weather_repository_imp.dart';
import 'package:weaather_flutter_app/src/domain/interactors/detail/detail_interactor.dart';
import 'package:weaather_flutter_app/src/domain/interactors/detail/detail_interactor_imp.dart';
import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor.dart';
import 'package:weaather_flutter_app/src/domain/interactors/home/home_interactor_imp.dart';
import 'package:weaather_flutter_app/src/domain/repository/cities/cities_repository.dart';
import 'package:weaather_flutter_app/src/domain/repository/weather/weather_repository.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/controller/detail_controller.dart';
import 'package:weaather_flutter_app/src/presentation/modules/home/controller/home_controller.dart';

class DIImp implements DI {

  final GetIt getIt = GetIt.instance;

  @override
  void init() {
    _registerCoreModule();
    _registerDomainModule();
    _registerPresentationModule();

  }


  _registerCoreModule(){
    getIt.registerFactory<IHttpClient>(() => HttpClient());
    getIt.registerFactory<ILocalStorage>(() => LocalStorageImp());
    getIt.registerLazySingleton<INavigationHandler>(() => NavigationHandler());
  }

  _registerDomainModule(){
    getIt.registerFactory<ICitiesRepository>(() => CitiesRepositoryImp(getIt()));
    getIt.registerFactory<IWeatherRepository>(() => WeatherRepositoryImp(getIt()));

    getIt.registerFactory<IHomeInteractor>(() => HomeInteractorImp(getIt(), getIt()));
    getIt.registerFactory<IDetailInteractor>(() => DetailInteractorImp(getIt()));
  }

  _registerPresentationModule(){
    getIt.registerFactory<HomeController>(() => HomeController(getIt()));
    getIt.registerFactory<DetailController>(() => DetailController(getIt()));
  }

  @override
  T get<T extends Object>([String? instanceName]) {
    return getIt.get<T>();
  }

}