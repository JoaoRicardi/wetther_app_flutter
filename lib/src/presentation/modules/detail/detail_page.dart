import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';

class WeatherDetailPage extends StatelessWidget with BasePage {

  static const String route = "/detail";

  const WeatherDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: (){
            navHandler.pop();
          },
        ),
      ),
      body: Container(
        color: Colors.purple,
      ),
    );
  }
}
