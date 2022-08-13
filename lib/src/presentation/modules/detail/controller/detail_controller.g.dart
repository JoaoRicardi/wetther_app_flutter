// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailController on _DetailController, Store {
  late final _$valuesAtom =
      Atom(name: '_DetailController.values', context: context);

  @override
  List<WeatherResponseModel>? get values {
    _$valuesAtom.reportRead();
    return super.values;
  }

  @override
  set values(List<WeatherResponseModel>? value) {
    _$valuesAtom.reportWrite(value, super.values, () {
      super.values = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_DetailController.model', context: context);

  @override
  CityModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CityModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_DetailController.init', context: context);

  @override
  Future init(CityModel model) {
    return _$initAsyncAction.run(() => super.init(model));
  }

  @override
  String toString() {
    return '''
values: ${values},
model: ${model}
    ''';
  }
}
