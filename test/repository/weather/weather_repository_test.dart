import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weaather_flutter_app/src/core/client/http_client/http_client.dart';
import 'package:weaather_flutter_app/src/core/client/http_client/http_client_imp.dart';
import 'package:weaather_flutter_app/src/core/error/custom_exception.dart';
import 'package:weaather_flutter_app/src/data/repository/weather/weather_repository_imp.dart';
import 'package:weaather_flutter_app/src/domain/repository/weather/weather_repository.dart';
import '../../utils/mock/response/weather_mocks.dart';
import '../../utils/utils.dart';

void main(){
  setUpAll((){
    TestUtils.setUpAllTests();
  });


  group("Test getting weather details from api",(){

    IHttpClient _service = HttpClient(
      dio: Dio(
        BaseOptions(
          baseUrl: "https://api.openweathermap.org/data/2.5"
        )
      )
    );
    var dioAdapter =  DioAdapter(dio: _service.instance);

    IWeatherRepository repository = WeatherRepositoryImp(_service);

    test("weather api response sucess", () async  {
      var sucessMock = WeatherMocks.mapResponse;
      var cityName = "São Paulo";
      dioAdapter.onGet(
        '/weather?q=$cityName',
            (server) => server.reply(
          200,
          sucessMock,
          delay: const Duration(seconds: 1),
        ),
      );

      var res = await repository.getWeather(cityName);

      expect(res.data["name"], WeatherMocks.mapResponse["name"]);
      expect(res.data["base"], WeatherMocks.mapResponse["base"]);
      expect(res.data["dt"], WeatherMocks.mapResponse["dt"]);
      expect(res.data["visibility"], WeatherMocks.mapResponse["visibility"]);
      expect(res.data["dt_txt"], WeatherMocks.mapResponse["dt_txt"]);
    });

    test("weather api empty response ", () async  {
      var emptyMock = {};
      var cityName = "São Paulo";
      dioAdapter.onGet(
        '/weather?q=$cityName',
            (server) => server.reply(
          200,
          emptyMock,
          delay: const Duration(seconds: 1),
        ),
      );

      var res = await repository.getWeather(cityName);

      expect(res.data["name"], null);
      expect(res.data["base"], null);
      expect(res.data["dt"], null);
      expect(res.data["visibility"], null);
      expect(res.data["dt_txt"], null);
    });

    test("weather api with error", () async  {
      var cityName = "São Paulo";
      var path ='/weather?q=$cityName';
      dioAdapter.onGet(
        path,
            (server) => server.throws(
          500,
          DioError(requestOptions: RequestOptions(path: path)),
          delay: const Duration(seconds: 1),
        ),
      );

      var res = await repository.getWeather(cityName);


      expect(res.statusCode, 500);
    });

  });
}