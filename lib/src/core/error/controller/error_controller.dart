import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:weaather_flutter_app/src/core/error/custom_exception.dart';

part 'error_controller.g.dart';

class ErrorController = _ErrorController with _$ErrorController;

abstract class _ErrorController with Store {
  @observable
  bool? isError;

  @observable
  String? errorMessage;

  @observable
  bool isTimeOutError = false;

  void handleException(exception) {
    debugPrint(exception.toString());
    isError = true;
    isTimeOutError = false;

    if(exception is CustomException){
      errorMessage  = exception.message ?? "Houve um erro inesperado.";
    }
  }

  @action
  setCustomError(String message){
    isError = true;
    errorMessage = message;
    isTimeOutError = false;
  }

  resetErrors() {
    isTimeOutError = false;
    errorMessage = "";
    isError = null;
  }
}
