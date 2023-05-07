// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hash_object.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HashObjectCWProxy {
  HashObject name(String name);

  HashObject snapshots(List<Snapshot> snapshots);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HashObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HashObject(...).copyWith(id: 12, name: "My name")
  /// ````
  HashObject call({
    String? name,
    List<Snapshot>? snapshots,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHashObject.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHashObject.copyWith.fieldName(...)`
class _$HashObjectCWProxyImpl implements _$HashObjectCWProxy {
  final HashObject _value;

  const _$HashObjectCWProxyImpl(this._value);

  @override
  HashObject name(String name) => this(name: name);

  @override
  HashObject snapshots(List<Snapshot> snapshots) => this(snapshots: snapshots);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HashObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HashObject(...).copyWith(id: 12, name: "My name")
  /// ````
  HashObject call({
    Object? name = const $CopyWithPlaceholder(),
    Object? snapshots = const $CopyWithPlaceholder(),
  }) {
    return HashObject(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      snapshots: snapshots == const $CopyWithPlaceholder() || snapshots == null
          ? _value.snapshots
          // ignore: cast_nullable_to_non_nullable
          : snapshots as List<Snapshot>,
    );
  }
}

extension $HashObjectCopyWith on HashObject {
  /// Returns a callable class that can be used as follows: `instanceOfHashObject.copyWith(...)` or like so:`instanceOfHashObject.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HashObjectCWProxy get copyWith => _$HashObjectCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HashObjectAdapter extends TypeAdapter<HashObject> {
  @override
  final int typeId = 3;

  @override
  HashObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HashObject(
      name: fields[1] as String,
      snapshots: (fields[2] as List).cast<Snapshot>(),
    );
  }

  @override
  void write(BinaryWriter writer, HashObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.snapshots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HashObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
