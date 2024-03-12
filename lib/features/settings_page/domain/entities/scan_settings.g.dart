// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScanSettingsCWProxy {
  ScanSettings gridSize(int gridSize);

  ScanSettings nSections(int nSections);

  ScanSettings algorithm(String algorithm);

  ScanSettings libVersion(String libVersion);

  ScanSettings transBytes(String transBytes);

  ScanSettings transBytesMode(TransBytesMode transBytesMode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScanSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScanSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  ScanSettings call({
    int? gridSize,
    int? nSections,
    String? algorithm,
    String? libVersion,
    String? transBytes,
    TransBytesMode? transBytesMode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScanSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScanSettings.copyWith.fieldName(...)`
class _$ScanSettingsCWProxyImpl implements _$ScanSettingsCWProxy {
  const _$ScanSettingsCWProxyImpl(this._value);

  final ScanSettings _value;

  @override
  ScanSettings gridSize(int gridSize) => this(gridSize: gridSize);

  @override
  ScanSettings nSections(int nSections) => this(nSections: nSections);

  @override
  ScanSettings algorithm(String algorithm) => this(algorithm: algorithm);

  @override
  ScanSettings libVersion(String libVersion) => this(libVersion: libVersion);

  @override
  ScanSettings transBytes(String transBytes) => this(transBytes: transBytes);

  @override
  ScanSettings transBytesMode(TransBytesMode transBytesMode) =>
      this(transBytesMode: transBytesMode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScanSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScanSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  ScanSettings call({
    Object? gridSize = const $CopyWithPlaceholder(),
    Object? nSections = const $CopyWithPlaceholder(),
    Object? algorithm = const $CopyWithPlaceholder(),
    Object? libVersion = const $CopyWithPlaceholder(),
    Object? transBytes = const $CopyWithPlaceholder(),
    Object? transBytesMode = const $CopyWithPlaceholder(),
  }) {
    return ScanSettings(
      gridSize: gridSize == const $CopyWithPlaceholder() || gridSize == null
          ? _value.gridSize
          // ignore: cast_nullable_to_non_nullable
          : gridSize as int,
      nSections: nSections == const $CopyWithPlaceholder() || nSections == null
          ? _value.nSections
          // ignore: cast_nullable_to_non_nullable
          : nSections as int,
      algorithm: algorithm == const $CopyWithPlaceholder() || algorithm == null
          ? _value.algorithm
          // ignore: cast_nullable_to_non_nullable
          : algorithm as String,
      libVersion:
          libVersion == const $CopyWithPlaceholder() || libVersion == null
              ? _value.libVersion
              // ignore: cast_nullable_to_non_nullable
              : libVersion as String,
      transBytes:
          transBytes == const $CopyWithPlaceholder() || transBytes == null
              ? _value.transBytes
              // ignore: cast_nullable_to_non_nullable
              : transBytes as String,
      transBytesMode: transBytesMode == const $CopyWithPlaceholder() ||
              transBytesMode == null
          ? _value.transBytesMode
          // ignore: cast_nullable_to_non_nullable
          : transBytesMode as TransBytesMode,
    );
  }
}

extension $ScanSettingsCopyWith on ScanSettings {
  /// Returns a callable class that can be used as follows: `instanceOfScanSettings.copyWith(...)` or like so:`instanceOfScanSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScanSettingsCWProxy get copyWith => _$ScanSettingsCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScanSettingsAdapter extends TypeAdapter<ScanSettings> {
  @override
  final int typeId = 1;

  @override
  ScanSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScanSettings(
      gridSize: fields[0] as int,
      nSections: fields[2] as int,
      algorithm: fields[1] as String,
      libVersion: fields[3] as String,
      transBytes: fields[4] as String,
      transBytesMode: fields[5] == null
          ? TransBytesMode.random
          : fields[5] as TransBytesMode,
    );
  }

  @override
  void write(BinaryWriter writer, ScanSettings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.gridSize)
      ..writeByte(1)
      ..write(obj.algorithm)
      ..writeByte(2)
      ..write(obj.nSections)
      ..writeByte(3)
      ..write(obj.libVersion)
      ..writeByte(4)
      ..write(obj.transBytes)
      ..writeByte(5)
      ..write(obj.transBytesMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScanSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransBytesModeAdapter extends TypeAdapter<TransBytesMode> {
  @override
  final int typeId = 10;

  @override
  TransBytesMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransBytesMode.none;
      case 1:
        return TransBytesMode.random;
      case 2:
        return TransBytesMode.specific;
      default:
        return TransBytesMode.none;
    }
  }

  @override
  void write(BinaryWriter writer, TransBytesMode obj) {
    switch (obj) {
      case TransBytesMode.none:
        writer.writeByte(0);
        break;
      case TransBytesMode.random:
        writer.writeByte(1);
        break;
      case TransBytesMode.specific:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransBytesModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
