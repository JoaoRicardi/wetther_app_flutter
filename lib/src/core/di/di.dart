abstract class DI{

  void init();


  T get<T extends Object>([String? instanceName]);

}