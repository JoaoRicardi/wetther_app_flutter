import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';
import 'package:weaather_flutter_app/src/presentation/modules/home/home_page.dart';

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with BasePage {

  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navHandler.appGlobalKey,
      initialRoute: MyHomePage.route,
      onGenerateRoute: navHandler.appRoutes,
    );
  }
}
