import 'package:weaather_flutter_app/src/core/di/di.dart';
import 'package:weaather_flutter_app/src/core/di/di_imp.dart';
import 'package:weaather_flutter_app/src/core/navigation/navigation_handler.dart';

class BaseWidget {

  T get<T extends Object>([String? instanceName]){
    DI dependenciesInjection = DIImp();
    return dependenciesInjection.get(instanceName);
  }

  INavigationHandler get navHandler => get();

}