// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppSettingsCWProxy {
  AppSettings darkTheme(bool darkTheme);

  AppSettings stableRequirement(int stableRequirement);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  AppSettings call({
    bool? darkTheme,
    int? stableRequirement,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppSettings.copyWith.fieldName(...)`
class _$AppSettingsCWProxyImpl implements _$AppSettingsCWProxy {
  final AppSettings _value;

  const _$AppSettingsCWProxyImpl(this._value);

  @override
  AppSettings darkTheme(bool darkTheme) => this(darkTheme: darkTheme);

  @override
  AppSettings stableRequirement(int stableRequirement) =>
      this(stableRequirement: stableRequirement);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  AppSettings call({
    Object? darkTheme = const $CopyWithPlaceholder(),
    Object? stableRequirement = const $CopyWithPlaceholder(),
  }) {
    return AppSettings(
      darkTheme: darkTheme == const $CopyWithPlaceholder() || darkTheme == null
          ? _value.darkTheme
          // ignore: cast_nullable_to_non_nullable
          : darkTheme as bool,
      stableRequirement: stableRequirement == const $CopyWithPlaceholder() ||
              stableRequirement == null
          ? _value.stableRequirement
          // ignore: cast_nullable_to_non_nullable
          : stableRequirement as int,
    );
  }
}

extension $AppSettingsCopyWith on AppSettings {
  /// Returns a callable class that can be used as follows: `instanceOfAppSettings.copyWith(...)` or like so:`instanceOfAppSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppSettingsCWProxy get copyWith => _$AppSettingsCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  final int typeId = 7;

  @override
  AppSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettings(
      darkTheme: fields[1] as bool,
      stableRequirement: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.stableRequirement)
      ..writeByte(1)
      ..write(obj.darkTheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
