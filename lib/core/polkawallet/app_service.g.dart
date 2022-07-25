// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_service.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppServiceCWProxy {
  AppService keyring(Keyring keyring);

  AppService plugin(PolkawalletPlugin plugin);

  AppService status(AppServiceInitStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppService(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppService(...).copyWith(id: 12, name: "My name")
  /// ````
  AppService call({
    Keyring? keyring,
    PolkawalletPlugin? plugin,
    AppServiceInitStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppService.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppService.copyWith.fieldName(...)`
class _$AppServiceCWProxyImpl implements _$AppServiceCWProxy {
  final AppService _value;

  const _$AppServiceCWProxyImpl(this._value);

  @override
  AppService keyring(Keyring keyring) => this(keyring: keyring);

  @override
  AppService plugin(PolkawalletPlugin plugin) => this(plugin: plugin);

  @override
  AppService status(AppServiceInitStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppService(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppService(...).copyWith(id: 12, name: "My name")
  /// ````
  AppService call({
    Object? keyring = const $CopyWithPlaceholder(),
    Object? plugin = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return AppService(
      keyring: keyring == const $CopyWithPlaceholder() || keyring == null
          ? _value.keyring
          // ignore: cast_nullable_to_non_nullable
          : keyring as Keyring,
      plugin: plugin == const $CopyWithPlaceholder() || plugin == null
          ? _value.plugin
          // ignore: cast_nullable_to_non_nullable
          : plugin as PolkawalletPlugin,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AppServiceInitStatus,
    );
  }
}

extension $AppServiceCopyWith on AppService {
  /// Returns a callable class that can be used as follows: `instanceOfclass AppService.name.copyWith(...)` or like so:`instanceOfclass AppService.name.copyWith.fieldName(...)`.
  _$AppServiceCWProxy get copyWith => _$AppServiceCWProxyImpl(this);
}
