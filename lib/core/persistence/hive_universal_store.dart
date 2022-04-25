import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/core/errors/storage_error.dart';

class HiveUniversalStore<T> {
  late final Box<T> _box;
  final String _boxName;

  HiveUniversalStore({
    required String boxName,
  }) : _boxName = boxName;

  Future<void> init() async {
    _box = await Hive.openBox(_boxName);
  }

  Future<void> addObject(T value) async {
    await _box.add(value);
    return await _box.flush();
  }

  Future<Iterable<int>> addAllObjects(List<T> list) async {
    return await _box.addAll(list);
  }

  Future<void> setObject(String key, T value) async {
    await _box.put(key, value);
    return await _box.flush();
  }

  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  Set<String> getKeys<String>() {
    return _box.keys.cast<String>().toSet();
  }

  Future<void> removeAt(String key) async {
    if (containsKey(key)) {
      await _box.delete(key);
      return await _box.flush();
    }
  }

  /// Delete object by unknown key
  Future<StorageError?> removeObject(T value) async {
    final map = _box.toMap();
    var key = map.keys.firstWhere((k) => map[k] == value, orElse: () => null);

    if (key != null) {
      await _box.delete(key);
      await _box.flush();
      return null;
    }
    return const StorageError.impossibleOperation();
  }

  Future<void> removeAll() async {
    final keys = getKeys();
    await _box.deleteAll(keys);
  }

  T getValue(String key, T defaultValue) {
    var value = _box.get(key);
    if (value != null) {
      return value;
    }
    return defaultValue;
  }

  T? getAt(int index) {
    if (_box.length > 0) {
      return _box.getAt(index);
    } else {
      return null;
    }
  }

  Future<void> putAt(int index, T value) async {
    await _box.putAt(index, value);
    return await _box.flush();
  }

  Future<void> putAt0(T value) async {
    if (_box.isEmpty) {
      _box.add(value);
    } else {
      await _box.putAt(0, value);
    }
    return await _box.flush();
  }

  Iterable<T> getAll() {
    return _box.values;
  }

  int get length => _box.values.length;
}
