// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashes_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HashesModelCWProxy {
  HashesModel hashes(List<String> hashes);

  HashesModel name(String name);

  HashesModel stamp(DateTime stamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HashesModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HashesModel(...).copyWith(id: 12, name: "My name")
  /// ````
  HashesModel call({
    List<String>? hashes,
    String? name,
    DateTime? stamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHashesModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHashesModel.copyWith.fieldName(...)`
class _$HashesModelCWProxyImpl implements _$HashesModelCWProxy {
  final HashesModel _value;

  const _$HashesModelCWProxyImpl(this._value);

  @override
  HashesModel hashes(List<String> hashes) => this(hashes: hashes);

  @override
  HashesModel name(String name) => this(name: name);

  @override
  HashesModel stamp(DateTime stamp) => this(stamp: stamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HashesModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HashesModel(...).copyWith(id: 12, name: "My name")
  /// ````
  HashesModel call({
    Object? hashes = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? stamp = const $CopyWithPlaceholder(),
  }) {
    return HashesModel(
      hashes: hashes == const $CopyWithPlaceholder() || hashes == null
          ? _value.hashes
          // ignore: cast_nullable_to_non_nullable
          : hashes as List<String>,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      stamp: stamp == const $CopyWithPlaceholder() || stamp == null
          ? _value.stamp
          // ignore: cast_nullable_to_non_nullable
          : stamp as DateTime,
    );
  }
}

extension $HashesModelCopyWith on HashesModel {
  /// Returns a callable class that can be used as follows: `instanceOfclass HashesModel.name.copyWith(...)` or like so:`instanceOfclass HashesModel.name.copyWith.fieldName(...)`.
  _$HashesModelCWProxy get copyWith => _$HashesModelCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HashesModelAdapter extends TypeAdapter<HashesModel> {
  @override
  final int typeId = 0;

  @override
  HashesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HashesModel(
      name: fields[0] as String,
      stamp: fields[1] as DateTime,
      hashes: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HashesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.stamp)
      ..writeByte(2)
      ..write(obj.hashes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HashesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
