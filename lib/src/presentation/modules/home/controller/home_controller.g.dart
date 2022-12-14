// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$storageCitiesAtom =
      Atom(name: '_HomeController.storageCities', context: context);

  @override
  List<CityModel>? get storageCities {
    _$storageCitiesAtom.reportRead();
    return super.storageCities;
  }

  @override
  set storageCities(List<CityModel>? value) {
    _$storageCitiesAtom.reportWrite(value, super.storageCities, () {
      super.storageCities = value;
    });
  }

  late final _$addCityNameToListAsyncAction =
      AsyncAction('_HomeController.addCityNameToList', context: context);

  @override
  Future addCityNameToList(String cityName) {
    return _$addCityNameToListAsyncAction
        .run(() => super.addCityNameToList(cityName));
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.init');
    try {
      return super.init();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
storageCities: ${storageCities}
    ''';
  }
}
