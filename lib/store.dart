import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'store.g.dart';

@HiveType(typeId: 0)
class HashesModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime stamp;

  @HiveField(2)
  List<String> hashes;

  HashesModel({
    required this.name,
    required this.stamp,
    required this.hashes,
  });
}

// class HashesModelAdapter extends TypeAdapter<HashesModel> {
//   @override
//   final typeId = 0;

//   @override
//   HashesModel read(BinaryReader reader) {
//     var obj = HashesModel(null, null, null);
//     var numOfFields = reader.readByte();
//     for (var i = 0; i < numOfFields; i++) {
//       switch (reader.readByte()) {
//         case 0:
//           obj.name = reader.read() as String;
//           break;
//         case 1:
//           obj.stamp = reader.read() as String;
//           break;
//         case 2:
//           obj.hashes = reader.read()?.toList();
//           break;
//       }
//     }
//     return obj;
//   }

//   @override
//   void write(BinaryWriter writer, HashesModel obj) {
//     writer.writeByte(3);
//     writer.writeByte(0);
//     writer.write(obj.name);
//     writer.writeByte(1);
//     writer.write(obj.stamp);
//     writer.writeByte(2);
//     writer.write(obj.hashes);
//   }
// }

class HiveUniversalStore<T> {
  late final Box<T> _box;
  final String _boxName;

  HiveUniversalStore({
    required String boxName,
  }) : _boxName = boxName;

  Future<void> init() async {
    _box = await Hive.openBox(_boxName);
  }

  Future<void> setObject(String key, T value) async {
    return await _box.put(key, value);
  }

  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  Set<String> getKeys<String>() {
    return _box.keys.cast<String>().toSet();
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

  T getValue(String key, T defaultValue) {
    var value = _box.get(key);
    if (value != null) {
      return value;
    }
    return defaultValue;
  }

  T? getAt(int index) {
    return _box.getAt(index);
  }

  int get length => _box.values.length;
}

/// A cache access provider class for shared preferences using Hive library
class HiveHashStore extends HiveUniversalStore<HashesModel> {
  HiveHashStore() : super(boxName: 'hashes');

  // Future<void> init() async {
  //   //

  //   _box = await Hive.openBox(keyName);
  //   int len = _box.values.length;
  //   print("$len");
  // }

  // get keys => getKeys();

  // get length => _box.values.length;

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

  // Future<void> setObject(String key, HashesModel value) async {
  //   return await _box.put(key, value);
  // }

  // bool containsKey(String key) {
  //   return _box.containsKey(key);
  // }

  // Set<String> getKeys<String>() {
  //   return _box.keys.cast<String>().toSet();
  // }

  // Future<void> remove(String key) async {
  //   if (containsKey(key)) {
  //     await _box.delete(key);
  //   }
  // }

  // Future<void> removeAll() async {
  //   final keys = getKeys();
  //   await _box.deleteAll(keys);
  // }

  // HashesModel getValue(String key, HashesModel defaultValue) {
  //   var value = _box.get(key);
  //   if (value != null) {
  //     return value;
  //   }
  //   return defaultValue;
  // }

  // HashesModel? getAt(int index) {
  //   return _box.getAt(index);
  // }
}
