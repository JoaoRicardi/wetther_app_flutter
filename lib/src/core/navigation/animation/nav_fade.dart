import 'package:flutter/material.dart';

class NavFade<T> extends PageRouteBuilder<T> {
  final Widget page;

  @override
  final RouteSettings settings;

  NavFade({required this.page, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );
}
