// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store_bloc.dart';

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
  /// Returns a callable class that can be used as follows: `instanceOfclass AccountCreate.name.copyWith(...)` or like so:`instanceOfclass AccountCreate.name.copyWith.fieldName(...)`.
  _$AccountCreateCWProxy get copyWith => _$AccountCreateCWProxyImpl(this);
}

abstract class _$AccountStoreStateCWProxy {
  AccountStoreState accountCreated(bool accountCreated);

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
    bool? accountCreated,
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
  AccountStoreState accountCreated(bool accountCreated) =>
      this(accountCreated: accountCreated);

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
    Object? accountCreated = const $CopyWithPlaceholder(),
    Object? addressIconsMap = const $CopyWithPlaceholder(),
    Object? newAccount = const $CopyWithPlaceholder(),
    Object? pubKeyAddressMap = const $CopyWithPlaceholder(),
    Object? recoveryInfo = const $CopyWithPlaceholder(),
    Object? walletConnectPairing = const $CopyWithPlaceholder(),
    Object? wcSessions = const $CopyWithPlaceholder(),
  }) {
    return AccountStoreState(
      accountCreated: accountCreated == const $CopyWithPlaceholder() ||
              accountCreated == null
          ? _value.accountCreated
          // ignore: cast_nullable_to_non_nullable
          : accountCreated as bool,
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
