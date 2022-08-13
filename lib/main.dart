import 'package:flutter/material.dart';

import 'package:weaather_flutter_app/src/app.dart';
import 'package:weaather_flutter_app/src/core/di/di.dart';
import 'package:weaather_flutter_app/src/core/di/di_imp.dart';
import 'package:weaather_flutter_app/src/core/local_storage/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DI dependenciesInjections = DIImp();

  dependenciesInjections.init();
  await dependenciesInjections.get<ILocalStorage>().init();

  runApp(MyApp());
}