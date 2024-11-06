import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/core/utils/logger.dart';

class HiveUniversalStore<T> {
  late final Box<T> _box;
  final String _boxName;

  HiveUniversalStore({
    required final String boxName,
  }) : _boxName = boxName;

  Future<void> init() async {
    _box = await Hive.openBox(_boxName);
  }

  Future<void> addObject(final T value) async {
    await _box.add(value);
    return _box.flush();
  }

  /// Delete object by unknown key
  Future<void> removeObject(final T value) async {
    final map = _box.toMap();
    final dynamic key = map.keys
        .firstWhere((final dynamic k) => map[k] == value, orElse: () => null);

    if (key != null) {
      await _box.delete(key);
      await _box.flush();
      return;
    } else {
      logger.e("Couldn't find object $value to remove");
      throw Exception("Couldn't find object $value to remove");
    }
  }

  // Future<void> removeAll() async {
  //   final keys = getKeys();
  //   await _box.deleteAll(keys);
  // }

  Future<void> replace(final T oldValue, final T newValue) async {
    final indexOfOld = _box.values.toList().indexOf(oldValue);

    // var index = -1;
    // for (int i = 0; i < _box.length; ++i) {
    //   if (_box.values.elementAt(i) == oldValue) {
    //     index = i;
    //     break;
    //   }
    // }

    if (indexOfOld == -1) {
      logger.e("Couldn't find object $oldValue to replace");
    } else {
      await _box.putAt(indexOfOld, newValue);
      await _box.flush();
    }
  }

  T? getAt(final int index) {
    return _box.length > 0 ? _box.getAt(index) : null;
  }

  Future<void> put(final int index, final T value) async {
    await _box.put(index, value);
    return _box.flush();
  }

  Future<void> putAt0(final T value) async {
    if (_box.isEmpty) {
      await _box.add(value);
    } else {
      await _box.putAt(0, value);
    }
    return _box.flush();
  }

  Iterable<T> getAll() {
    return _box.values;
  }

  Future<void> clear() async {
    await _box.clear();
    await _box.flush();
  }

  int get length => _box.values.length;
}
