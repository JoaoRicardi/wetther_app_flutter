class HttpResponse {
  final int statusCode;
  final Map<String, dynamic>? data;
  final Exception? exception;

  HttpResponse(
      this.statusCode, {
        this.data,
        this.exception
      });

  static HttpResponse fromException(Exception exception, {Map<String, dynamic>? data}){
    return HttpResponse(500, exception: exception,data: data);
  }

  static HttpResponse fromResponse(int statusCode, {Map<String, dynamic>? data}){
    return HttpResponse(statusCode ,data: data);
  }

}