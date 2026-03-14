// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WalletSettingsCWProxy {
  WalletSettings connectionMode(ConnectionMode connectionMode);

  WalletSettings nodeUrl(String nodeUrl);

  WalletSettings explorerUrl(String? explorerUrl);

  WalletSettings explorerConnectionMode(ConnectionMode? explorerConnectionMode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WalletSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WalletSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  WalletSettings call({
    ConnectionMode connectionMode,
    String nodeUrl,
    String? explorerUrl,
    ConnectionMode? explorerConnectionMode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWalletSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWalletSettings.copyWith.fieldName(...)`
class _$WalletSettingsCWProxyImpl implements _$WalletSettingsCWProxy {
  const _$WalletSettingsCWProxyImpl(this._value);

  final WalletSettings _value;

  @override
  WalletSettings connectionMode(ConnectionMode connectionMode) =>
      this(connectionMode: connectionMode);

  @override
  WalletSettings nodeUrl(String nodeUrl) => this(nodeUrl: nodeUrl);

  @override
  WalletSettings explorerUrl(String? explorerUrl) =>
      this(explorerUrl: explorerUrl);

  @override
  WalletSettings explorerConnectionMode(
          ConnectionMode? explorerConnectionMode) =>
      this(explorerConnectionMode: explorerConnectionMode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WalletSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WalletSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  WalletSettings call({
    Object? connectionMode = const $CopyWithPlaceholder(),
    Object? nodeUrl = const $CopyWithPlaceholder(),
    Object? explorerUrl = const $CopyWithPlaceholder(),
    Object? explorerConnectionMode = const $CopyWithPlaceholder(),
  }) {
    return WalletSettings(
      connectionMode: connectionMode == const $CopyWithPlaceholder()
          ? _value.connectionMode
          // ignore: cast_nullable_to_non_nullable
          : connectionMode as ConnectionMode,
      nodeUrl: nodeUrl == const $CopyWithPlaceholder()
          ? _value.nodeUrl
          // ignore: cast_nullable_to_non_nullable
          : nodeUrl as String,
      explorerUrl: explorerUrl == const $CopyWithPlaceholder()
          ? _value.explorerUrl
          // ignore: cast_nullable_to_non_nullable
          : explorerUrl as String?,
      explorerConnectionMode:
          explorerConnectionMode == const $CopyWithPlaceholder()
              ? _value.explorerConnectionMode
              // ignore: cast_nullable_to_non_nullable
              : explorerConnectionMode as ConnectionMode?,
    );
  }
}

extension $WalletSettingsCopyWith on WalletSettings {
  /// Returns a callable class that can be used as follows: `instanceOfWalletSettings.copyWith(...)` or like so:`instanceOfWalletSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WalletSettingsCWProxy get copyWith => _$WalletSettingsCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletSettingsAdapter extends TypeAdapter<WalletSettings> {
  @override
  final int typeId = 5;

  @override
  WalletSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalletSettings(
      connectionMode: fields[2] == null
          ? ConnectionMode.defaultRandom
          : fields[2] as ConnectionMode,
      nodeUrl: fields[1] as String,
      explorerUrl: fields[3] as String?,
      explorerConnectionMode: fields[4] as ConnectionMode?,
    );
  }

  @override
  void write(BinaryWriter writer, WalletSettings obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.nodeUrl)
      ..writeByte(2)
      ..write(obj.connectionMode)
      ..writeByte(3)
      ..write(obj.explorerUrl)
      ..writeByte(4)
      ..write(obj.explorerConnectionMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
