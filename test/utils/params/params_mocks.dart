import 'package:mocktail/mocktail.dart';

import '../mock/response/weather_mocks.dart';


class ParamsMock {
  registerAllMockParams(){
    registerFallbackValue(MockWeatherResponseModel());
    registerFallbackValue(MockHttpResponseModel());
  }
}