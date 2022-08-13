import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/app.dart';
import 'package:weaather_flutter_app/src/core/di/di.dart';
import 'package:weaather_flutter_app/src/core/di/di_imp.dart';

void main() {

  DI dependenciesInjections = DIImp();

  dependenciesInjections.init();


  runApp(MyApp());
}