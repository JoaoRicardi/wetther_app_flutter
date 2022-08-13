import 'package:flutter/material.dart';

abstract class INavigationHandler {
  late GlobalKey<NavigatorState> appGlobalKey;

  Route<dynamic> appRoutes(RouteSettings settings);

  Future<T?> push<T extends Object?>(
      String route, {
        Object? arguments,
      });

  pop<T extends Object?>([
    T? result,
  ]);

}