// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppSettingsCWProxy {
  AppSettings darkTheme(bool darkTheme);

  AppSettings stableRequirement(int stableRequirement);

  AppSettings showZeroAssets(bool showZeroAssets);

  AppSettings oldPinCode(String oldPinCode);

  AppSettings newPinHash(int? newPinHash);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  AppSettings call({
    bool? darkTheme,
    int? stableRequirement,
    bool? showZeroAssets,
    String? oldPinCode,
    int? newPinHash,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppSettings.copyWith.fieldName(...)`
class _$AppSettingsCWProxyImpl implements _$AppSettingsCWProxy {
  const _$AppSettingsCWProxyImpl(this._value);

  final AppSettings _value;

  @override
  AppSettings darkTheme(bool darkTheme) => this(darkTheme: darkTheme);

  @override
  AppSettings stableRequirement(int stableRequirement) =>
      this(stableRequirement: stableRequirement);

  @override
  AppSettings showZeroAssets(bool showZeroAssets) =>
      this(showZeroAssets: showZeroAssets);

  @override
  AppSettings oldPinCode(String oldPinCode) => this(oldPinCode: oldPinCode);

  @override
  AppSettings newPinHash(int? newPinHash) => this(newPinHash: newPinHash);

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
    Object? showZeroAssets = const $CopyWithPlaceholder(),
    Object? oldPinCode = const $CopyWithPlaceholder(),
    Object? newPinHash = const $CopyWithPlaceholder(),
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
      showZeroAssets: showZeroAssets == const $CopyWithPlaceholder() ||
              showZeroAssets == null
          ? _value.showZeroAssets
          // ignore: cast_nullable_to_non_nullable
          : showZeroAssets as bool,
      oldPinCode:
          oldPinCode == const $CopyWithPlaceholder() || oldPinCode == null
              ? _value.oldPinCode
              // ignore: cast_nullable_to_non_nullable
              : oldPinCode as String,
      newPinHash: newPinHash == const $CopyWithPlaceholder()
          ? _value.newPinHash
          // ignore: cast_nullable_to_non_nullable
          : newPinHash as int?,
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
      showZeroAssets: fields[2] == null ? false : fields[2] as bool,
      oldPinCode: fields[3] == null ? '' : fields[3] as String,
      newPinHash: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.stableRequirement)
      ..writeByte(1)
      ..write(obj.darkTheme)
      ..writeByte(2)
      ..write(obj.showZeroAssets)
      ..writeByte(3)
      ..write(obj.oldPinCode)
      ..writeByte(4)
      ..write(obj.newPinHash);
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
