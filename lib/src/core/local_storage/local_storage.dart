abstract class ILocalStorage {

  ///metodo que inicializa o plugin
  init();

  T? storeItem<T>(String dbName, T item, String key);

  Future<T?> getItem<T>(String dbName, String key);
}