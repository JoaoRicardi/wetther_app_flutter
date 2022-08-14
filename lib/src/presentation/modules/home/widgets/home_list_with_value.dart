

import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/presentation/modules/home/controller/home_controller.dart';
import 'package:weaather_flutter_app/src/presentation/modules/home/widgets/home_list_item.dart';

class HomeListWithValue extends StatelessWidget {

  final HomeController homeController;

  const HomeListWithValue({
    Key? key,
    required this.homeController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top  + 56,
            left: 12,
          ),
          child: const Text("Weather", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),),
        ),
        const SizedBox(height: 16,),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                itemCount: homeController.storageCities?.length ?? 0,
                itemBuilder: (context, index) {
                  var city = homeController.storageCities![index];
                  return HomeListItem(
                    city: city,
                  );
                })
        )
      ],
    );
  }
}
