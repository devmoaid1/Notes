abstract class LocalStorageProvider {
  Future<T> getData<T>(String key, [String boxName]);
  Future<void> setData<T>(String key, T value, [String boxName]);
  Future<void> removeData<T>(T value, [String boxName]);
}

abstract class HiveStorageProvider extends LocalStorageProvider {
  Future<void> addData<T>(T value, [String boxName]);
  Future<void> editData<T>(T value, T oldValue, [String boxName]);
}
