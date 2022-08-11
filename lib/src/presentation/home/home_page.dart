import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';

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
      delegate: TheSearch(),
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

class TheSearch extends SearchDelegate<String> {

  TheSearch();

  final suggestions = [
    "Silverstone, UK",
    "São Paulo, Brazil",
    "Melbourne, Australia",
    "Monte Carlo, Monaco"
  ];

  @override
  String get searchFieldLabel => "Procure pela cidade ou estado";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final suggestions = query.isEmpty ? suggestions : [];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (content, index) => ListTile(
          title: Text(suggestions[index])),
    );
  }
}