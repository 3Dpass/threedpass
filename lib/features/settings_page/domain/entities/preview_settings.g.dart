// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PreviewSettingsCWProxy {
  PreviewSettings antialias(bool antialias);

  PreviewSettings pixelRatio(double pixelRatio);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreviewSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreviewSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  PreviewSettings call({
    bool? antialias,
    double? pixelRatio,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPreviewSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPreviewSettings.copyWith.fieldName(...)`
class _$PreviewSettingsCWProxyImpl implements _$PreviewSettingsCWProxy {
  final PreviewSettings _value;

  const _$PreviewSettingsCWProxyImpl(this._value);

  @override
  PreviewSettings antialias(bool antialias) => this(antialias: antialias);

  @override
  PreviewSettings pixelRatio(double pixelRatio) => this(pixelRatio: pixelRatio);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreviewSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreviewSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  PreviewSettings call({
    Object? antialias = const $CopyWithPlaceholder(),
    Object? pixelRatio = const $CopyWithPlaceholder(),
  }) {
    return PreviewSettings(
      antialias: antialias == const $CopyWithPlaceholder() || antialias == null
          ? _value.antialias
          // ignore: cast_nullable_to_non_nullable
          : antialias as bool,
      pixelRatio:
          pixelRatio == const $CopyWithPlaceholder() || pixelRatio == null
              ? _value.pixelRatio
              // ignore: cast_nullable_to_non_nullable
              : pixelRatio as double,
    );
  }
}

extension $PreviewSettingsCopyWith on PreviewSettings {
  /// Returns a callable class that can be used as follows: `instanceOfPreviewSettings.copyWith(...)` or like so:`instanceOfPreviewSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PreviewSettingsCWProxy get copyWith => _$PreviewSettingsCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreviewSettingsAdapter extends TypeAdapter<PreviewSettings> {
  @override
  final int typeId = 6;

  @override
  PreviewSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreviewSettings(
      pixelRatio: fields[0] as double,
      antialias: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PreviewSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pixelRatio)
      ..writeByte(1)
      ..write(obj.antialias);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreviewSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
