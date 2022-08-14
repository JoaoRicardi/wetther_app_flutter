import 'package:weaather_flutter_app/src/core/error/custom_exception_type.dart';

class CustomException<T> implements Exception {
  final String? message;
  String? code;
  final T? error;
  final CustomExceptionTypes? type;
  CustomException({this.message, this.error, this.code, this.type});
}