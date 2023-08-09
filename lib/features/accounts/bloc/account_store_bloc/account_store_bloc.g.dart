// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountStoreStateCWProxy {
  AccountStoreState addressIconsMap(Map<String, String> addressIconsMap);

  AccountStoreState newAccount(AccountInfo newAccount);

  AccountStoreState pubKeyAddressMap(
      Map<int, Map<String, String>> pubKeyAddressMap);

  AccountStoreState recoveryInfo(RecoveryInfo recoveryInfo);

  AccountStoreState accountAdvancedOptions(
      AccountAdvancedOptions accountAdvancedOptions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountStoreState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountStoreState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountStoreState call({
    Map<String, String>? addressIconsMap,
    AccountInfo? newAccount,
    Map<int, Map<String, String>>? pubKeyAddressMap,
    RecoveryInfo? recoveryInfo,
    AccountAdvancedOptions? accountAdvancedOptions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountStoreState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountStoreState.copyWith.fieldName(...)`
class _$AccountStoreStateCWProxyImpl implements _$AccountStoreStateCWProxy {
  const _$AccountStoreStateCWProxyImpl(this._value);

  final AccountStoreState _value;

  @override
  AccountStoreState addressIconsMap(Map<String, String> addressIconsMap) =>
      this(addressIconsMap: addressIconsMap);

  @override
  AccountStoreState newAccount(AccountInfo newAccount) =>
      this(newAccount: newAccount);

  @override
  AccountStoreState pubKeyAddressMap(
          Map<int, Map<String, String>> pubKeyAddressMap) =>
      this(pubKeyAddressMap: pubKeyAddressMap);

  @override
  AccountStoreState recoveryInfo(RecoveryInfo recoveryInfo) =>
      this(recoveryInfo: recoveryInfo);

  @override
  AccountStoreState accountAdvancedOptions(
          AccountAdvancedOptions accountAdvancedOptions) =>
      this(accountAdvancedOptions: accountAdvancedOptions);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountStoreState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountStoreState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountStoreState call({
    Object? addressIconsMap = const $CopyWithPlaceholder(),
    Object? newAccount = const $CopyWithPlaceholder(),
    Object? pubKeyAddressMap = const $CopyWithPlaceholder(),
    Object? recoveryInfo = const $CopyWithPlaceholder(),
    Object? accountAdvancedOptions = const $CopyWithPlaceholder(),
  }) {
    return AccountStoreState(
      addressIconsMap: addressIconsMap == const $CopyWithPlaceholder() ||
              addressIconsMap == null
          ? _value.addressIconsMap
          // ignore: cast_nullable_to_non_nullable
          : addressIconsMap as Map<String, String>,
      newAccount:
          newAccount == const $CopyWithPlaceholder() || newAccount == null
              ? _value.newAccount
              // ignore: cast_nullable_to_non_nullable
              : newAccount as AccountInfo,
      pubKeyAddressMap: pubKeyAddressMap == const $CopyWithPlaceholder() ||
              pubKeyAddressMap == null
          ? _value.pubKeyAddressMap
          // ignore: cast_nullable_to_non_nullable
          : pubKeyAddressMap as Map<int, Map<String, String>>,
      recoveryInfo:
          recoveryInfo == const $CopyWithPlaceholder() || recoveryInfo == null
              ? _value.recoveryInfo
              // ignore: cast_nullable_to_non_nullable
              : recoveryInfo as RecoveryInfo,
      accountAdvancedOptions:
          accountAdvancedOptions == const $CopyWithPlaceholder() ||
                  accountAdvancedOptions == null
              ? _value.accountAdvancedOptions
              // ignore: cast_nullable_to_non_nullable
              : accountAdvancedOptions as AccountAdvancedOptions,
    );
  }
}

extension $AccountStoreStateCopyWith on AccountStoreState {
  /// Returns a callable class that can be used as follows: `instanceOfAccountStoreState.copyWith(...)` or like so:`instanceOfAccountStoreState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountStoreStateCWProxy get copyWith =>
      _$AccountStoreStateCWProxyImpl(this);
}
