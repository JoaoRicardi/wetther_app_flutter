import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/data/model/response/weather/weather_response_model.dart';

class WeatherItem extends StatelessWidget {

  final WeatherResponseModel weatherResponseModel;

  const WeatherItem({
    Key? key,
    required this.weatherResponseModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(4, 4))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Row(
                children: [
                  Text(
                    '${weatherResponseModel.dateFromTxt?.day}',
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8,),
                  _buildCustomDivider(),
                  const SizedBox(width: 8,),
                  Text('${weatherResponseModel.description[0].description}'),
                ],
              )),
              Flexible(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                _buildValueWithDescription(weatherResponseModel.values?.min.toString() ?? "", "MIN"),
                SizedBox(width: 8,),
                _buildValueWithDescription(weatherResponseModel.values?.max.toString() ?? "", "MAX")
              ],))



            ],
          ),
        ),
      ),
    );
  }


  _buildCustomDivider(){
    return Container(
      width: 1,
      height: 16,
      color: Colors.black,
    );
  }


  _buildValueWithDescription(String value, String description){
    return Column(
      children: [
        Text(value, style: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 18),),
        Text(description)
      ],
    );
  }
}
