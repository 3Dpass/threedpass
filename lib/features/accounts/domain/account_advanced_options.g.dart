// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_advanced_options.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountAdvancedOptionsCWProxy {
  AccountAdvancedOptions path(String path);

  AccountAdvancedOptions type(CryptoType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountAdvancedOptions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountAdvancedOptions(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountAdvancedOptions call({
    String? path,
    CryptoType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountAdvancedOptions.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountAdvancedOptions.copyWith.fieldName(...)`
class _$AccountAdvancedOptionsCWProxyImpl
    implements _$AccountAdvancedOptionsCWProxy {
  final AccountAdvancedOptions _value;

  const _$AccountAdvancedOptionsCWProxyImpl(this._value);

  @override
  AccountAdvancedOptions path(String path) => this(path: path);

  @override
  AccountAdvancedOptions type(CryptoType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountAdvancedOptions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountAdvancedOptions(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountAdvancedOptions call({
    Object? path = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return AccountAdvancedOptions(
      path: path == const $CopyWithPlaceholder() || path == null
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as CryptoType,
    );
  }
}

extension $AccountAdvancedOptionsCopyWith on AccountAdvancedOptions {
  /// Returns a callable class that can be used as follows: `instanceOfAccountAdvancedOptions.copyWith(...)` or like so:`instanceOfAccountAdvancedOptions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountAdvancedOptionsCWProxy get copyWith =>
      _$AccountAdvancedOptionsCWProxyImpl(this);
}
