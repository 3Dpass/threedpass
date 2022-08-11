// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GlobalSettingsConfigCWProxy {
  GlobalSettingsConfig scanSettings(ScanSettings scanSettings);

  GlobalSettingsConfig walletSettings(WalletSettings walletSettings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GlobalSettingsConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GlobalSettingsConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  GlobalSettingsConfig call({
    ScanSettings? scanSettings,
    WalletSettings? walletSettings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGlobalSettingsConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGlobalSettingsConfig.copyWith.fieldName(...)`
class _$GlobalSettingsConfigCWProxyImpl
    implements _$GlobalSettingsConfigCWProxy {
  final GlobalSettingsConfig _value;

  const _$GlobalSettingsConfigCWProxyImpl(this._value);

  @override
  GlobalSettingsConfig scanSettings(ScanSettings scanSettings) =>
      this(scanSettings: scanSettings);

  @override
  GlobalSettingsConfig walletSettings(WalletSettings walletSettings) =>
      this(walletSettings: walletSettings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GlobalSettingsConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GlobalSettingsConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  GlobalSettingsConfig call({
    Object? scanSettings = const $CopyWithPlaceholder(),
    Object? walletSettings = const $CopyWithPlaceholder(),
  }) {
    return GlobalSettingsConfig(
      scanSettings:
          scanSettings == const $CopyWithPlaceholder() || scanSettings == null
              ? _value.scanSettings
              // ignore: cast_nullable_to_non_nullable
              : scanSettings as ScanSettings,
      walletSettings: walletSettings == const $CopyWithPlaceholder() ||
              walletSettings == null
          ? _value.walletSettings
          // ignore: cast_nullable_to_non_nullable
          : walletSettings as WalletSettings,
    );
  }
}

extension $GlobalSettingsConfigCopyWith on GlobalSettingsConfig {
  /// Returns a callable class that can be used as follows: `instanceOfGlobalSettingsConfig.copyWith(...)` or like so:`instanceOfGlobalSettingsConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GlobalSettingsConfigCWProxy get copyWith =>
      _$GlobalSettingsConfigCWProxyImpl(this);
}
