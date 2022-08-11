
import 'package:flutter/material.dart';

class WeatherSearchDelegate extends SearchDelegate<String> {

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