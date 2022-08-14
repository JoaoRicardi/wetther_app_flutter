// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ErrorController on _ErrorController, Store {
  late final _$isErrorAtom =
      Atom(name: '_ErrorController.isError', context: context);

  @override
  bool? get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool? value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ErrorController.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isTimeOutErrorAtom =
      Atom(name: '_ErrorController.isTimeOutError', context: context);

  @override
  bool get isTimeOutError {
    _$isTimeOutErrorAtom.reportRead();
    return super.isTimeOutError;
  }

  @override
  set isTimeOutError(bool value) {
    _$isTimeOutErrorAtom.reportWrite(value, super.isTimeOutError, () {
      super.isTimeOutError = value;
    });
  }

  late final _$_ErrorControllerActionController =
      ActionController(name: '_ErrorController', context: context);

  @override
  dynamic setCustomError(String message) {
    final _$actionInfo = _$_ErrorControllerActionController.startAction(
        name: '_ErrorController.setCustomError');
    try {
      return super.setCustomError(message);
    } finally {
      _$_ErrorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isError: ${isError},
errorMessage: ${errorMessage},
isTimeOutError: ${isTimeOutError}
    ''';
  }
}
