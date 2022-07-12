import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/common/logger.dart';
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

  // Future<void> removeAll() async {
  //   final keys = getKeys();
  //   await _box.deleteAll(keys);
  // }

  Future<void> replace(T value) async {
    var index = -1;
    for (int i = 0; i < _box.length; ++i) {
      if (_box.values.elementAt(i) == value) {
        index = i;
        break;
      }
    }

    if (index == -1) {
      logger.e("Couldn't find object $value to replace");
    } else {
      await _box.putAt(index, value);
    }
  }

  // T getValue(String key, T defaultValue) {
  //   var value = _box.get(key);
  //   if (value != null) {
  //     return value;
  //   }
  //   return defaultValue;
  // }

  T? getAt(int index) {
    return _box.length > 0 ? _box.getAt(index) : null;
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
