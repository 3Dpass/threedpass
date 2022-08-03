// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountCreateCWProxy {
  AccountCreate mnemonicKey(String mnemonicKey);

  AccountCreate name(String name);

  AccountCreate password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountCreate call({
    String? mnemonicKey,
    String? name,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountCreate.copyWith.fieldName(...)`
class _$AccountCreateCWProxyImpl implements _$AccountCreateCWProxy {
  final AccountCreate _value;

  const _$AccountCreateCWProxyImpl(this._value);

  @override
  AccountCreate mnemonicKey(String mnemonicKey) =>
      this(mnemonicKey: mnemonicKey);

  @override
  AccountCreate name(String name) => this(name: name);

  @override
  AccountCreate password(String password) => this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountCreate call({
    Object? mnemonicKey = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return AccountCreate(
      mnemonicKey:
          mnemonicKey == const $CopyWithPlaceholder() || mnemonicKey == null
              ? _value.mnemonicKey
              // ignore: cast_nullable_to_non_nullable
              : mnemonicKey as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $AccountCreateCopyWith on AccountCreate {
  /// Returns a callable class that can be used as follows: `instanceOfAccountCreate.copyWith(...)` or like so:`instanceOfAccountCreate.copyWith.fieldName(...)`.
  _$AccountCreateCWProxy get copyWith => _$AccountCreateCWProxyImpl(this);
}
