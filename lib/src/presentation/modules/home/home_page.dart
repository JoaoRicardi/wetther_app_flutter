import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';
import 'package:weaather_flutter_app/src/core/base/controller/base_controller.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/detail_page.dart';
import 'package:weaather_flutter_app/src/presentation/modules/home/controller/home_controller.dart';
import 'package:weaather_flutter_app/src/presentation/modules/home/widgets/home_list_with_value.dart';
import 'package:weaather_flutter_app/src/presentation/widgtes/custom_dialog.dart';
import 'package:weaather_flutter_app/src/presentation/widgtes/empty_state.dart';
import 'package:weaather_flutter_app/src/presentation/widgtes/loading.dart';
import 'package:weaather_flutter_app/src/presentation/widgtes/search/search_delegate.dart';

class MyHomePage extends StatefulWidget {
  static const String route = "/cities";

  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with BaseWidget {

  late HomeController _controller;
  late List<ReactionDisposer> _reactions;

  @override
  void initState() {
    _controller = get()..init();
    _reactions = [
      reaction((_) => _controller.errorController.isError, (bool? hasError) async {
        if(hasError != null && hasError){
          await showDialog(
            context: context,
            builder: (context){
              return CustomDialog(
                message: _controller.errorController.errorMessage ?? "Erro inesperado",
              );
            }
          );

          _controller.errorController.resetErrors();
        }
      })
    ];

    super.initState();
  }


  Future<void> _showSearch() async {
    var res = await showSearch(
      context: context,
      delegate: WeatherSearchDelegate(),
    );

    if (res != null && res.isNotEmpty) {
      await _controller.addCityNameToList(res);
    }
  }

  @override
  void dispose() {
    _reactions.map((e) => e.reaction.dispose()).toList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WeatherLoading(
      controller: _controller,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Observer(builder: (context) {
            return (_controller.storageCities?.isNotEmpty ?? false)
                ? HomeListWithValue(
              homeController: _controller,
            )
                : const WeatherEmptyState();
          }),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom == 0.0
                  ? 32
                  : MediaQuery.of(context).padding.bottom),
          child: ElevatedButton(
            onPressed: () => _showSearch(),
            child: const Text('Add cidade'),
          ),
        ),
      ),
    );
  }
}

