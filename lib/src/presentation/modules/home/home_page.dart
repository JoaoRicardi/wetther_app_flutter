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
            return const HomeCard();
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


class HomeCard extends StatelessWidget {

  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16,right: 16,top: 16
      ),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopInfo(),
            _buildBottomInfo()
          ],
        ),
      ),
    );
  }


  _buildTopInfo(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('São Paulo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Text('32°',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 32
            ),)
          ],
        ),
      ),
    );
  }

  _buildBottomInfo(){
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Sunny',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          ),
          Text('51.50 | 3-0.12',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14
          ),)
        ],
      ),
    );
  }
}
