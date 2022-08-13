import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/controller/detail_controller.dart';

class WeatherDetailPage extends StatefulWidget {

  final CityModel city;

  static const String route = "/detail";

  const WeatherDetailPage({
    Key? key,
    required this.city
  }) : super(key: key);

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> with BasePage  {

  late DetailController _detailController;

  @override
  void initState() {
    _detailController = get()..init(widget.city);
    super.initState();
  }

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
      body: Center(
        child: Column(
          children: [
            Observer(
              builder: (context){
                var value = _detailController.model;
                return Text("${value?.cityName} ${value?.tempMin}");
              }
            ),
            SizedBox(height: 200,),
            Observer(
              builder: (context){
                return Container(
                  width: double.infinity,
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _detailController.values?.length ?? 0,
                    itemBuilder: (context, index){
                      var obj = _detailController.values![index];
                      return Container(
                        width: 100,
                        child: Column(
                          children: [
                            Text(obj.values?.temp.toString() ?? ""),
                            Text(obj.dtTxt ?? "")
                          ],
                        ),
                      );
                    }
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
