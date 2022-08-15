import 'package:get_it/get_it.dart';

import '../mock/repository/repository_mocks.dart';

class DIMock {

  final GetIt getIt = GetIt.I;

  registerMocks(){
    _initPresentationModule();
    _initCoreModule();
    _initDataModule();
  }

  _initPresentationModule(){
  }

  _initCoreModule(){

  }

  _initDataModule(){

  }

}