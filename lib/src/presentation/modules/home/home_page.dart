import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/detail_page.dart';
import 'package:weaather_flutter_app/src/presentation/widgtes/search/search_delegate.dart';

class MyHomePage extends StatefulWidget {

  static const String route  = "/home";

  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with BasePage {

  var minhasCidade = <String>[];

  Future<void> _showSearch() async {
    var res = await showSearch(
      context: context,
      delegate: WeatherSearchDelegate(),
    );

    if(res != null && res.isEmpty) {
      setState(() {
        minhasCidade.add(res);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 32
        ),
        child: ListView.builder(
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                navHandler.push(WeatherDetailPage.route);
              },
              leading: const Text("Nome cidade"),
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
        child: InkWell(
          onTap: _showSearch,
          child: ElevatedButton(
            onPressed: _showSearch,
            child: Text('Add cidade'),
          ),
        ),
      ),
    );
  }
}
