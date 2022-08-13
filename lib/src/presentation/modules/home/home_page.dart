import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/detail_page.dart';
import 'package:weaather_flutter_app/src/presentation/modules/home/controller/home_controller.dart';
import 'package:weaather_flutter_app/src/presentation/widgtes/search/search_delegate.dart';

class MyHomePage extends StatefulWidget {

  static const String route  = "/cities";

  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with BasePage {

  late HomeController _controller;

  @override
  void initState() {
    _controller = get()
      ..init();
    super.initState();
  }

  Future<void> _showSearch() async {
    var res = await showSearch(
      context: context,
      delegate: WeatherSearchDelegate(),
    );

    if(res !=  null && res.isNotEmpty) {
      await _controller.getWeatherForCity(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 32
        ),
        child: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: _controller.storageCities?.length ?? 0,
              itemBuilder: (context, index){
                var city = _controller.storageCities![index];
                return ListTile(
                  title: Text(city.cityName),
                  onTap: (){
                    navHandler.push(WeatherDetailPage.route,arguments: city);
                  },
                  leading: Text(city.temp.toString()),
                );
              }
            );
          }
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).padding.bottom == 0.0 ? 32 : MediaQuery.of(context).padding.bottom
        ),
        child: ElevatedButton(
          onPressed: ()=> _showSearch(),
          child: Text('Add cidade'),
        ),
      ),
    );
  }
}
