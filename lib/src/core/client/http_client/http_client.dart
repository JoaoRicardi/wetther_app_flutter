import 'package:dio/dio.dart';
import 'package:weaather_flutter_app/src/data/model/response/http_response.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(String path, {Map<String, dynamic>? queryParameters});

  Dio get instance;
}