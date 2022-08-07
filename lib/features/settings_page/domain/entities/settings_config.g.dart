// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_config.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsConfigCWProxy {
  SettingsConfig algorithm(Algorithm algorithm);

  SettingsConfig gridSize(int gridSize);

  SettingsConfig nSections(int nSections);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsConfig call({
    Algorithm? algorithm,
    int? gridSize,
    int? nSections,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingsConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingsConfig.copyWith.fieldName(...)`
class _$SettingsConfigCWProxyImpl implements _$SettingsConfigCWProxy {
  final SettingsConfig _value;

  const _$SettingsConfigCWProxyImpl(this._value);

  @override
  SettingsConfig algorithm(Algorithm algorithm) => this(algorithm: algorithm);

  @override
  SettingsConfig gridSize(int gridSize) => this(gridSize: gridSize);

  @override
  SettingsConfig nSections(int nSections) => this(nSections: nSections);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsConfig call({
    Object? algorithm = const $CopyWithPlaceholder(),
    Object? gridSize = const $CopyWithPlaceholder(),
    Object? nSections = const $CopyWithPlaceholder(),
  }) {
    return SettingsConfig(
      algorithm: algorithm == const $CopyWithPlaceholder() || algorithm == null
          ? _value.algorithm
          // ignore: cast_nullable_to_non_nullable
          : algorithm as Algorithm,
      gridSize: gridSize == const $CopyWithPlaceholder() || gridSize == null
          ? _value.gridSize
          // ignore: cast_nullable_to_non_nullable
          : gridSize as int,
      nSections: nSections == const $CopyWithPlaceholder() || nSections == null
          ? _value.nSections
          // ignore: cast_nullable_to_non_nullable
          : nSections as int,
    );
  }
}

extension $SettingsConfigCopyWith on SettingsConfig {
  /// Returns a callable class that can be used as follows: `instanceOfSettingsConfig.copyWith(...)` or like so:`instanceOfSettingsConfig.copyWith.fieldName(...)`.
  _$SettingsConfigCWProxy get copyWith => _$SettingsConfigCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsConfigAdapter extends TypeAdapter<SettingsConfig> {
  @override
  final int typeId = 1;

  @override
  SettingsConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsConfig(
      gridSize: fields[0] as int,
      nSections: fields[2] as int,
      algorithm: fields[1] as Algorithm,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.gridSize)
      ..writeByte(1)
      ..write(obj.algorithm)
      ..writeByte(2)
      ..write(obj.nSections);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AlgorithmAdapter extends TypeAdapter<Algorithm> {
  @override
  final int typeId = 2;

  @override
  Algorithm read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Algorithm.spectrum;
      case 1:
        return Algorithm.grid;
      default:
        return Algorithm.spectrum;
    }
  }

  @override
  void write(BinaryWriter writer, Algorithm obj) {
    switch (obj) {
      case Algorithm.spectrum:
        writer.writeByte(0);
        break;
      case Algorithm.grid:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlgorithmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
