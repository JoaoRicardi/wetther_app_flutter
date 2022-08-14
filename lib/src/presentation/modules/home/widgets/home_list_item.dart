

import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/detail_page.dart';

class HomeListItem extends StatelessWidget with BaseWidget{
  final CityModel city;

  const HomeListItem({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => navHandler.push(WeatherDetailPage.route,arguments: city),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(4, 4))
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(city.cityName,style: const TextStyle(fontSize: 18),),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(city.caption),
                      ],
                    )),
                Flexible(
                    child: city.fullfilledValue
                        ? Text(city.temp.toString() + "K", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),)
                        : const CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
