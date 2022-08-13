
import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';

class WeatherSearchDelegate extends SearchDelegate<String> with BasePage {

  WeatherSearchDelegate();

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
    var places = suggestions.where((sugest) => sugest.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (content, index) => ListTile(
        onTap: (){
          navHandler.pop(places[index]);
        },
          title: Text(places[index])),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (content, index) => ListTile(
          onTap: (){
            navHandler.pop(suggestions[index]);
          },
          title: Text(suggestions[index])),
    );
  }
}