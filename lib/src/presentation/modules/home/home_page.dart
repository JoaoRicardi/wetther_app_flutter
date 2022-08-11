import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';
import 'package:weaather_flutter_app/src/presentation/widgtes/search/search_delegate.dart';

class MyHomePage extends StatefulWidget with BasePage {

  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
            return Padding(
              padding: const EdgeInsets.only(
                left: 16,right: 16,top: 16
              ),
              child: Container(
                width: double.infinity,
                height: 120,
                color: Colors.red,
              ),
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
          child: Container(
            width: double.infinity,
            height: 56,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}
