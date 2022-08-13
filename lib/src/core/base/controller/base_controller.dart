import 'package:mobx/mobx.dart';

part 'base_controller.g.dart';

class BaseController = _BaseController with _$BaseController;

abstract class _BaseController with Store {

  @observable
  bool isLoading = false;

  @action
  setLoading(bool value){
    isLoading = value;
  }

}