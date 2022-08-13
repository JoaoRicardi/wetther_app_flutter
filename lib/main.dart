import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weaather_flutter_app/src/app.dart';
import 'package:weaather_flutter_app/src/core/di/di.dart';
import 'package:weaather_flutter_app/src/core/di/di_imp.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DI dependenciesInjections = DIImp();

  dependenciesInjections.init();

  await Hive.initFlutter();
  Hive.registerAdapter(CityModelAdapter());
  await Hive.openBox<CityModel>("cities");

  runApp(MyApp());
}