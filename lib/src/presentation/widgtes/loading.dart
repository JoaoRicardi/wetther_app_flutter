

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weaather_flutter_app/src/core/base/controller/base_controller.dart';

class WeatherLoading extends StatelessWidget {

  final BaseController controller;
  final Widget child;

  const WeatherLoading({
    Key? key,
    required this.controller,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Observer(
            builder: (context) {
              return Visibility(
                visible: controller.isLoading,
                child: Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
        ),
      ],
    );
  }
}
