import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


@HiveType(typeId: 0)
class HashesModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String stamp;

  // var now = new DateTime.now();

  @HiveField(2)
  List<String> hashes;

  HashesModel(this.name, this.stamp, this.hashes);

}


class HashesModelAdapter extends TypeAdapter<HashesModel> {
  @override
  final typeId = 0;

  @override
  HashesModel read(BinaryReader reader) {
    var obj = HashesModel(null, null, null);
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.name = reader.read() as String;
          break;
        case 1:
          obj.stamp = reader.read() as String;
          break;
        case 2:
          obj.hashes =
              reader.read()?.toList();
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, HashesModel obj) {
    writer.writeByte(3);
    writer.writeByte(0);
    writer.write(obj.name);
    writer.writeByte(1);
    writer.write(obj.stamp);
    writer.writeByte(2);
    writer.write(obj.hashes);
  }
}


/// A cache access provider class for shared preferences using Hive library
class HiveStore {
  Box _box;
  final String keyName = 'hashes';

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (!kIsWeb) {
      try {
        Hive.registerAdapter(HashesModelAdapter());
        Directory defaultDirectory = await getApplicationDocumentsDirectory();
        Hive.init(defaultDirectory.path);
    } catch (e) {
    print(e);
    }
    }
    _box = await Hive.openBox(keyName);

    int len = _box?.values?.length;
    print("$len");
  }

  get keys => getKeys();

  get length => _box?.values?.length ?? 0;



//  @override
//  bool getBool(String key) {
//    return _preferences.get(key);
//  }
//
//  @override
//  double getDouble(String key) {
//    return _preferences.get(key);
//  }
//
//  @override
//  int getInt(String key) {
//    return _preferences.get(key);
//  }
//
//  @override
//  String getString(String key) {
//    return _preferences.get(key);
//  }
//
//  @override
//  Future<void> setBool(String key, bool value) {
//    return _preferences.put(key, value);
//  }
//
//  @override
//  Future<void> setDouble(String key, double value) {
//    return _preferences.put(key, value);
//  }
//
//  @override
//  Future<void> setInt(String key, int value) {
//    return _preferences.put(key, value);
//  }
//
//  @override
//  Future<void> setString(String key, String value) {
//    return _preferences.put(key, value);
//  }

  Future<void> setObject<T>(String key, T value) {
    return _box.put(key, value);
  }

  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  Set<E> getKeys<E>() {
    return _box.keys.cast<E>().toSet();
  }

  Future<void> remove(String key) async {
    if (containsKey(key)) {
      await _box.delete(key);
    }
  }

  Future<void> removeAll() async {
    final keys = getKeys();
    await _box.deleteAll(keys);
  }

  T getValue<T>(String key, T defaultValue) {
    var value = _box.get(key);
    if (value is T) {
      return value;
    }
    return defaultValue;
  }

  T getAt<T>(int index) {
    var value = _box.getAt(index);
    if (value is T) {
      return value;
    }
    return null;
  }
}
