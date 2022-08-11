import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weaather_flutter_app/src/core/client/http_client/http_client.dart';
import 'package:weaather_flutter_app/src/data/model/response/http_response.dart';

class HttpClient implements IHttpClient {

  late Dio _dio;

  HttpClient(){
    _dio = Dio();
  }

  @override
  Future<HttpResponse> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try{
      var res = await _dio.get(path, queryParameters: queryParameters);

      return HttpResponse.fromResponse(res.statusCode ?? 0, data: res.data);

    }on Exception catch(err){
      debugPrint("HttpClient:get $err");

      return HttpResponse.fromException(err);
    }
  }
}
