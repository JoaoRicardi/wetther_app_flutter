
import 'package:flutter/material.dart';

class WeatherEmptyState extends StatelessWidget {
  const WeatherEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.cloud_outlined),
          Text('Ainda não há cidades na sua lista.')
        ],
      ),
    );
  }
}
