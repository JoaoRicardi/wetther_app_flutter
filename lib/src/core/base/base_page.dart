import 'package:weaather_flutter_app/src/core/di/di_imp.dart';

class BasePage {

  T get<T extends Object>([String? instanceName]){
    return DIImp().get(instanceName);
  }

}