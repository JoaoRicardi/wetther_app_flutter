import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.queryParameters.addAll({
      "APPID": "710273420e4626139ccd0011d4b0b861"
    });


    super.onRequest(options, handler);
  }

}