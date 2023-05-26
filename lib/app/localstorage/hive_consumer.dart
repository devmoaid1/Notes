import 'package:hive_flutter/hive_flutter.dart';

import '../errors/exceptions.dart';
import 'localstorage_provider.dart';

class HiveStorageService implements HiveStorageProvider {
  Future<void> init(String boxName) async {
    await Hive.initFlutter();
  }

  @override
  Future<T> getData<T>(String key, [String? boxName]) async {
    try {
      // if box closed open it
      if (!Hive.isBoxOpen(boxName!)) {
        await Hive.openBox<T>(boxName);
      }
      final box = Hive.box<T>(boxName);

      final value = box.get(key);

      return value as T;
    } catch (err) {
      throw const CacheException();
    }
  }

  @override
  Future<void> setData<T>(String key, T value, [String? boxName]) async {
    try {
      if (!Hive.isBoxOpen(boxName!)) {
        await Hive.openBox<T>(boxName);
      }
      final box = Hive.box<T>(boxName);
      // if given value doesnt exist add it to box
      if (!box.containsKey(key)) {
        box.put(key, value);
      }
    } catch (err) {
      throw const CacheException();
    }
  }

  @override
  Future<void> addData<T>(T value, [String? boxName]) async {
    try {
      if (!Hive.isBoxOpen(boxName!)) {
        await Hive.openBox<T>(boxName);
      }
      final box = Hive.box<T>(boxName);
      // if given value doesnt exist add it to box
      if (!box.values.toList().contains(value)) {
        box.add(value);
      } else {
        // get index to remove then add
        final index = box.values.toList().indexOf(value);
        box.deleteAt(index);
        box.add(value);
      }
    } catch (err) {
      throw const CacheException();
    }
  }

  @override
  Future<void> removeData<T>(T value, [String? boxName]) async {
    // implement removeData  like the above functions using hive
    try {
      if (!Hive.isBoxOpen(boxName!)) {
        await Hive.openBox<T>(boxName);
      }
      final box = Hive.box<T>(boxName);

      // get index to remove then add
      final index = box.values.toList().indexOf(value);
      box.deleteAt(index);
    } catch (err) {
      throw const CacheException();
    }
  }

  @override
  Future<void> editData<T>(T value, T oldValue, [String? boxName]) async {
    try {
      if (!Hive.isBoxOpen(boxName!)) {
        await Hive.openBox<T>(boxName);
      }
      final box = Hive.box<T>(boxName);
      // if given value doesnt exist add it to box

      // get index to remove old value then add new value
      final index = box.values.toList().indexOf(oldValue);
      box.deleteAt(index);
      box.add(value);
    } catch (err) {
      throw const CacheException();
    }
  }
}
