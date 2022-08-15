import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:weaather_flutter_app/src/core/base/base_page.dart';
import 'package:weaather_flutter_app/src/data/model/local/city_model.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/controller/detail_controller.dart';
import 'package:weaather_flutter_app/src/presentation/modules/detail/widgets/weather_item.dart';
import 'package:weaather_flutter_app/src/presentation/widgtes/custom_dialog.dart';

class WeatherDetailPage extends StatefulWidget {
  final CityModel city;

  static const String route = "/detail";

  const WeatherDetailPage({Key? key, required this.city}) : super(key: key);

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> with BaseWidget {
  late DetailController _detailController;
  late List<ReactionDisposer> _reactions;

  @override
  void initState() {
    _detailController = get()..init(widget.city);
    _reactions = [
      reaction((_) => _detailController.errorController.isError, (bool? hasError) async {
        if(hasError != null && hasError){
          await showDialog(
              context: context,
              builder: (context){
                return CustomDialog(
                  message: _detailController.errorController.errorMessage ?? "Erro inesperado",
                );
              }
          );

          _detailController.errorController.resetErrors();
        }
      })
    ];
    super.initState();
  }

  @override
  void dispose() {
    _reactions.map((e) => e.reaction.dispose()).toList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var safeArea = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            navHandler.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (context) {
              var value = _detailController.model;
              return Text(
                '${value?.cityName}',
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 32),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Today:',
              style: TextStyle(fontSize: 18),
            ),
            Observer(builder: (context) {
              var value = _detailController.model;
              return FittedBox(
                child: Text(
                  '${value?.temp} K',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 44),
                ),
              );
            }),
            const Text(
              'Next days:',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: Observer(builder: (context) {
                return _detailController.isLoading ? const Center(
                  child: CircularProgressIndicator(),
                ):ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _detailController.values?.length ?? 0,
                    itemBuilder: (context, index) {
                      var obj = _detailController.values![index];
                     return WeatherItem(weatherResponseModel: obj,);
                    });
              }),
            ),
            SizedBox(
              height: safeArea == 0.0 ? 32 : safeArea,
            )
          ],
        ),
      ),
    );
  }
}
