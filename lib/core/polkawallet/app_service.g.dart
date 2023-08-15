// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_service.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppServiceCWProxy {
  AppService plugin(PolkawalletPlugin plugin);

  AppService keyring(Keyring keyring);

  AppService status(AppServiceInitStatus status);

  AppService networkStateData(NetworkStateData? networkStateData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppService(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppService(...).copyWith(id: 12, name: "My name")
  /// ````
  AppService call({
    PolkawalletPlugin? plugin,
    Keyring? keyring,
    AppServiceInitStatus? status,
    NetworkStateData? networkStateData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppService.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppService.copyWith.fieldName(...)`
class _$AppServiceCWProxyImpl implements _$AppServiceCWProxy {
  const _$AppServiceCWProxyImpl(this._value);

  final AppService _value;

  @override
  AppService plugin(PolkawalletPlugin plugin) => this(plugin: plugin);

  @override
  AppService keyring(Keyring keyring) => this(keyring: keyring);

  @override
  AppService status(AppServiceInitStatus status) => this(status: status);

  @override
  AppService networkStateData(NetworkStateData? networkStateData) =>
      this(networkStateData: networkStateData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppService(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppService(...).copyWith(id: 12, name: "My name")
  /// ````
  AppService call({
    Object? plugin = const $CopyWithPlaceholder(),
    Object? keyring = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? networkStateData = const $CopyWithPlaceholder(),
  }) {
    return AppService(
      plugin: plugin == const $CopyWithPlaceholder() || plugin == null
          ? _value.plugin
          // ignore: cast_nullable_to_non_nullable
          : plugin as PolkawalletPlugin,
      keyring: keyring == const $CopyWithPlaceholder() || keyring == null
          ? _value.keyring
          // ignore: cast_nullable_to_non_nullable
          : keyring as Keyring,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AppServiceInitStatus,
      networkStateData: networkStateData == const $CopyWithPlaceholder()
          ? _value.networkStateData
          // ignore: cast_nullable_to_non_nullable
          : networkStateData as NetworkStateData?,
    );
  }
}

extension $AppServiceCopyWith on AppService {
  /// Returns a callable class that can be used as follows: `instanceOfAppService.copyWith(...)` or like so:`instanceOfAppService.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppServiceCWProxy get copyWith => _$AppServiceCWProxyImpl(this);
}
