import 'package:get_it/get_it.dart';
import 'package:weaather_flutter_app/src/core/client/http_client/http_client.dart';
import 'package:weaather_flutter_app/src/core/client/http_client/http_client_imp.dart';
import 'package:weaather_flutter_app/src/core/di/di.dart';

class DIImp implements DI {

  final GetIt getIt = GetIt.instance;

  @override
  void init() {
    _registerCoreModule();

  }


  _registerCoreModule(){
    getIt.registerFactory<IHttpClient>(() => HttpClient());
  }

  @override
  T get<T extends Object>([String? instanceName]) {
    return getIt.get<T>();
  }

}