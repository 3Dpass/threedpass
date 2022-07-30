// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountStoreStateCWProxy {
  AccountStoreState accountAdvancedOptions(
      AccountAdvancedOptions accountAdvancedOptions);

  AccountStoreState addressIconsMap(Map<String, String> addressIconsMap);

  AccountStoreState newAccount(AccountCreate newAccount);

  AccountStoreState pubKeyAddressMap(
      Map<int, Map<String, String>> pubKeyAddressMap);

  AccountStoreState recoveryInfo(RecoveryInfo recoveryInfo);

  AccountStoreState walletConnectPairing(bool walletConnectPairing);

  AccountStoreState wcSessions(List<WCPairedData> wcSessions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountStoreState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountStoreState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountStoreState call({
    AccountAdvancedOptions? accountAdvancedOptions,
    Map<String, String>? addressIconsMap,
    AccountCreate? newAccount,
    Map<int, Map<String, String>>? pubKeyAddressMap,
    RecoveryInfo? recoveryInfo,
    bool? walletConnectPairing,
    List<WCPairedData>? wcSessions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountStoreState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountStoreState.copyWith.fieldName(...)`
class _$AccountStoreStateCWProxyImpl implements _$AccountStoreStateCWProxy {
  final AccountStoreState _value;

  const _$AccountStoreStateCWProxyImpl(this._value);

  @override
  AccountStoreState accountAdvancedOptions(
          AccountAdvancedOptions accountAdvancedOptions) =>
      this(accountAdvancedOptions: accountAdvancedOptions);

  @override
  AccountStoreState addressIconsMap(Map<String, String> addressIconsMap) =>
      this(addressIconsMap: addressIconsMap);

  @override
  AccountStoreState newAccount(AccountCreate newAccount) =>
      this(newAccount: newAccount);

  @override
  AccountStoreState pubKeyAddressMap(
          Map<int, Map<String, String>> pubKeyAddressMap) =>
      this(pubKeyAddressMap: pubKeyAddressMap);

  @override
  AccountStoreState recoveryInfo(RecoveryInfo recoveryInfo) =>
      this(recoveryInfo: recoveryInfo);

  @override
  AccountStoreState walletConnectPairing(bool walletConnectPairing) =>
      this(walletConnectPairing: walletConnectPairing);

  @override
  AccountStoreState wcSessions(List<WCPairedData> wcSessions) =>
      this(wcSessions: wcSessions);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountStoreState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountStoreState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountStoreState call({
    Object? accountAdvancedOptions = const $CopyWithPlaceholder(),
    Object? addressIconsMap = const $CopyWithPlaceholder(),
    Object? newAccount = const $CopyWithPlaceholder(),
    Object? pubKeyAddressMap = const $CopyWithPlaceholder(),
    Object? recoveryInfo = const $CopyWithPlaceholder(),
    Object? walletConnectPairing = const $CopyWithPlaceholder(),
    Object? wcSessions = const $CopyWithPlaceholder(),
  }) {
    return AccountStoreState(
      accountAdvancedOptions:
          accountAdvancedOptions == const $CopyWithPlaceholder() ||
                  accountAdvancedOptions == null
              ? _value.accountAdvancedOptions
              // ignore: cast_nullable_to_non_nullable
              : accountAdvancedOptions as AccountAdvancedOptions,
      addressIconsMap: addressIconsMap == const $CopyWithPlaceholder() ||
              addressIconsMap == null
          ? _value.addressIconsMap
          // ignore: cast_nullable_to_non_nullable
          : addressIconsMap as Map<String, String>,
      newAccount:
          newAccount == const $CopyWithPlaceholder() || newAccount == null
              ? _value.newAccount
              // ignore: cast_nullable_to_non_nullable
              : newAccount as AccountCreate,
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
      walletConnectPairing:
          walletConnectPairing == const $CopyWithPlaceholder() ||
                  walletConnectPairing == null
              ? _value.walletConnectPairing
              // ignore: cast_nullable_to_non_nullable
              : walletConnectPairing as bool,
      wcSessions:
          wcSessions == const $CopyWithPlaceholder() || wcSessions == null
              ? _value.wcSessions
              // ignore: cast_nullable_to_non_nullable
              : wcSessions as List<WCPairedData>,
    );
  }
}

extension $AccountStoreStateCopyWith on AccountStoreState {
  /// Returns a callable class that can be used as follows: `instanceOfclass AccountStoreState.name.copyWith(...)` or like so:`instanceOfclass AccountStoreState.name.copyWith.fieldName(...)`.
  _$AccountStoreStateCWProxy get copyWith =>
      _$AccountStoreStateCWProxyImpl(this);
}
