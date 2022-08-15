import 'package:get_it/get_it.dart';
// import 'package:isow/src/domain/repository/cep/cep_repository.dart';
// import 'package:isow/src/presentation/initial/controller/initial_controller.dart';

import '../mock/repository/repository_mocks.dart';

class DIMock {

  final GetIt getIt = GetIt.I;

  registerMocks(){
    _initPresentationModule();
    _initCoreModule();
    _initDataModule();
  }

  _initPresentationModule(){
    // getIt.registerLazySingleton<InitialController>(() => InitialController(getIt.get()));
  }

  _initCoreModule(){
    // getIt.registerFactory<ILocalStorage>(() => LocalStorage());
    //
    // ///registe two diferentes factorys to get with and without authentication
    // getIt.registerFactory<IHttpClientService>(() => HttpClient.withAuthOptions(),instanceName: "wAuth");
    // getIt.registerFactory<IHttpClientService>(() => HttpClient.withAuthOptions(),instanceName: "wOutAuth");
  }

  _initDataModule(){
    // getIt.registerLazySingleton<ICepRepository>(() => CepRepositoryMock());
  }

}