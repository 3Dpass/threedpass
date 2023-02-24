// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapshot.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SnapshotCWProxy {
  Snapshot fileHash(int fileHash);

  Snapshot hashes(List<String> hashes);

  Snapshot name(String name);

  Snapshot relativePath(String? relativePath);

  Snapshot settingsConfig(ScanSettings settingsConfig);

  Snapshot stamp(DateTime stamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Snapshot(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Snapshot(...).copyWith(id: 12, name: "My name")
  /// ````
  Snapshot call({
    int? fileHash,
    List<String>? hashes,
    String? name,
    String? relativePath,
    ScanSettings? settingsConfig,
    DateTime? stamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSnapshot.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSnapshot.copyWith.fieldName(...)`
class _$SnapshotCWProxyImpl implements _$SnapshotCWProxy {
  final Snapshot _value;

  const _$SnapshotCWProxyImpl(this._value);

  @override
  Snapshot fileHash(int fileHash) => this(fileHash: fileHash);

  @override
  Snapshot hashes(List<String> hashes) => this(hashes: hashes);

  @override
  Snapshot name(String name) => this(name: name);

  @override
  Snapshot relativePath(String? relativePath) =>
      this(relativePath: relativePath);

  @override
  Snapshot settingsConfig(ScanSettings settingsConfig) =>
      this(settingsConfig: settingsConfig);

  @override
  Snapshot stamp(DateTime stamp) => this(stamp: stamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Snapshot(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Snapshot(...).copyWith(id: 12, name: "My name")
  /// ````
  Snapshot call({
    Object? fileHash = const $CopyWithPlaceholder(),
    Object? hashes = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? relativePath = const $CopyWithPlaceholder(),
    Object? settingsConfig = const $CopyWithPlaceholder(),
    Object? stamp = const $CopyWithPlaceholder(),
  }) {
    return Snapshot(
      fileHash: fileHash == const $CopyWithPlaceholder() || fileHash == null
          ? _value.fileHash
          // ignore: cast_nullable_to_non_nullable
          : fileHash as int,
      hashes: hashes == const $CopyWithPlaceholder() || hashes == null
          ? _value.hashes
          // ignore: cast_nullable_to_non_nullable
          : hashes as List<String>,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      relativePath: relativePath == const $CopyWithPlaceholder()
          ? _value.relativePath
          // ignore: cast_nullable_to_non_nullable
          : relativePath as String?,
      settingsConfig: settingsConfig == const $CopyWithPlaceholder() ||
              settingsConfig == null
          ? _value.settingsConfig
          // ignore: cast_nullable_to_non_nullable
          : settingsConfig as ScanSettings,
      stamp: stamp == const $CopyWithPlaceholder() || stamp == null
          ? _value.stamp
          // ignore: cast_nullable_to_non_nullable
          : stamp as DateTime,
    );
  }
}

extension $SnapshotCopyWith on Snapshot {
  /// Returns a callable class that can be used as follows: `instanceOfSnapshot.copyWith(...)` or like so:`instanceOfSnapshot.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SnapshotCWProxy get copyWith => _$SnapshotCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SnapshotAdapter extends TypeAdapter<Snapshot> {
  @override
  final int typeId = 0;

  @override
  Snapshot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Snapshot(
      name: fields[0] as String,
      stamp: fields[1] as DateTime,
      hashes: (fields[2] as List).cast<String>(),
      settingsConfig: fields[4] as ScanSettings,
      fileHash: fields[5] as int,
      relativePath: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Snapshot obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.stamp)
      ..writeByte(2)
      ..write(obj.hashes)
      ..writeByte(6)
      ..write(obj.relativePath)
      ..writeByte(4)
      ..write(obj.settingsConfig)
      ..writeByte(5)
      ..write(obj.fileHash);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SnapshotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
