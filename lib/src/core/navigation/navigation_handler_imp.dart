import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/navigation/animation/nav_fade.dart';
import 'package:weaather_flutter_app/src/core/navigation/navigation_handler.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/detail_page.dart';
import 'package:weaather_flutter_app/src/presentation/modules/home/home_page.dart';

class NavigationHandler implements INavigationHandler {

  @override
  GlobalKey<NavigatorState> appGlobalKey = GlobalKey();

  @override
  Route appRoutes(RouteSettings settings) {
    debugPrint('NavigationHandler: appRoute ${settings.name}');
    switch (settings.name) {

      case MyHomePage.route:
        return NavFade(page: MyHomePage(), settings: settings);

      case WeatherDetailPage.route:
        return NavFade(page: WeatherDetailPage(
          city: settings.arguments as CityModel,
        ), settings: settings);

      default:
        return MaterialPageRoute(
          builder: (context){
            return const Center(
              child: Text('rota deconhecida'),
            );
          }
        );
    }
  }

  @override
  Future<T?> push<T extends Object?>(
      String route, {
        Object? arguments,
      }) async {
    return Navigator.pushNamed(
      appGlobalKey.currentContext!,
      route,
      arguments: arguments,
    );
  }

  @override
  void pop<T extends Object?>([
    T? result,
  ]) {
    return Navigator.pop<T>(appGlobalKey.currentContext!, result);
  }
}