import 'package:flutter/material.dart';

class WeatherDetailPage extends StatelessWidget {

  static const String route = "/detail";

  const WeatherDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
      ),
    );
  }
}
