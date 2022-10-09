// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountCreateMnemonicCWProxy {
  AccountCreateMnemonic mnemonic(String mnemonic);

  AccountCreateMnemonic name(String name);

  AccountCreateMnemonic password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountCreateMnemonic(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountCreateMnemonic(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountCreateMnemonic call({
    String? mnemonic,
    String? name,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountCreateMnemonic.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountCreateMnemonic.copyWith.fieldName(...)`
class _$AccountCreateMnemonicCWProxyImpl
    implements _$AccountCreateMnemonicCWProxy {
  final AccountCreateMnemonic _value;

  const _$AccountCreateMnemonicCWProxyImpl(this._value);

  @override
  AccountCreateMnemonic mnemonic(String mnemonic) => this(mnemonic: mnemonic);

  @override
  AccountCreateMnemonic name(String name) => this(name: name);

  @override
  AccountCreateMnemonic password(String password) => this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountCreateMnemonic(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountCreateMnemonic(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountCreateMnemonic call({
    Object? mnemonic = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return AccountCreateMnemonic(
      mnemonic: mnemonic == const $CopyWithPlaceholder() || mnemonic == null
          ? _value.mnemonic
          // ignore: cast_nullable_to_non_nullable
          : mnemonic as String,
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

extension $AccountCreateMnemonicCopyWith on AccountCreateMnemonic {
  /// Returns a callable class that can be used as follows: `instanceOfAccountCreateMnemonic.copyWith(...)` or like so:`instanceOfAccountCreateMnemonic.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountCreateMnemonicCWProxy get copyWith =>
      _$AccountCreateMnemonicCWProxyImpl(this);
}

abstract class _$AccountCreateSeedCWProxy {
  AccountCreateSeed name(String name);

  AccountCreateSeed password(String password);

  AccountCreateSeed seed(String seed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountCreateSeed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountCreateSeed(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountCreateSeed call({
    String? name,
    String? password,
    String? seed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountCreateSeed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountCreateSeed.copyWith.fieldName(...)`
class _$AccountCreateSeedCWProxyImpl implements _$AccountCreateSeedCWProxy {
  final AccountCreateSeed _value;

  const _$AccountCreateSeedCWProxyImpl(this._value);

  @override
  AccountCreateSeed name(String name) => this(name: name);

  @override
  AccountCreateSeed password(String password) => this(password: password);

  @override
  AccountCreateSeed seed(String seed) => this(seed: seed);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountCreateSeed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountCreateSeed(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountCreateSeed call({
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? seed = const $CopyWithPlaceholder(),
  }) {
    return AccountCreateSeed(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      seed: seed == const $CopyWithPlaceholder() || seed == null
          ? _value.seed
          // ignore: cast_nullable_to_non_nullable
          : seed as String,
    );
  }
}

extension $AccountCreateSeedCopyWith on AccountCreateSeed {
  /// Returns a callable class that can be used as follows: `instanceOfAccountCreateSeed.copyWith(...)` or like so:`instanceOfAccountCreateSeed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountCreateSeedCWProxy get copyWith =>
      _$AccountCreateSeedCWProxyImpl(this);
}
