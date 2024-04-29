// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poscan_assets_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PoscanAssetsStateCWProxy {
  PoscanAssetsState assets(List<PoscanAssetData> assets);

  PoscanAssetsState metadata(Map<int, PoscanAssetMetadata> metadata);

  PoscanAssetsState balances(Map<int, PoscanAssetBalance> balances);

  PoscanAssetsState currentAccount(KeyPairData currentAccount);

  PoscanAssetsState isLoading(bool isLoading);

  PoscanAssetsState errorMessage(String errorMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PoscanAssetsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PoscanAssetsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PoscanAssetsState call({
    List<PoscanAssetData>? assets,
    Map<int, PoscanAssetMetadata>? metadata,
    Map<int, PoscanAssetBalance>? balances,
    KeyPairData? currentAccount,
    bool? isLoading,
    String? errorMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPoscanAssetsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPoscanAssetsState.copyWith.fieldName(...)`
class _$PoscanAssetsStateCWProxyImpl implements _$PoscanAssetsStateCWProxy {
  const _$PoscanAssetsStateCWProxyImpl(this._value);

  final PoscanAssetsState _value;

  @override
  PoscanAssetsState assets(List<PoscanAssetData> assets) =>
      this(assets: assets);

  @override
  PoscanAssetsState metadata(Map<int, PoscanAssetMetadata> metadata) =>
      this(metadata: metadata);

  @override
  PoscanAssetsState balances(Map<int, PoscanAssetBalance> balances) =>
      this(balances: balances);

  @override
  PoscanAssetsState currentAccount(KeyPairData currentAccount) =>
      this(currentAccount: currentAccount);

  @override
  PoscanAssetsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  PoscanAssetsState errorMessage(String errorMessage) =>
      this(errorMessage: errorMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PoscanAssetsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PoscanAssetsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PoscanAssetsState call({
    Object? assets = const $CopyWithPlaceholder(),
    Object? metadata = const $CopyWithPlaceholder(),
    Object? balances = const $CopyWithPlaceholder(),
    Object? currentAccount = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
  }) {
    return PoscanAssetsState(
      assets: assets == const $CopyWithPlaceholder() || assets == null
          ? _value.assets
          // ignore: cast_nullable_to_non_nullable
          : assets as List<PoscanAssetData>,
      metadata: metadata == const $CopyWithPlaceholder() || metadata == null
          ? _value.metadata
          // ignore: cast_nullable_to_non_nullable
          : metadata as Map<int, PoscanAssetMetadata>,
      balances: balances == const $CopyWithPlaceholder() || balances == null
          ? _value.balances
          // ignore: cast_nullable_to_non_nullable
          : balances as Map<int, PoscanAssetBalance>,
      currentAccount: currentAccount == const $CopyWithPlaceholder() ||
              currentAccount == null
          ? _value.currentAccount
          // ignore: cast_nullable_to_non_nullable
          : currentAccount as KeyPairData,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      errorMessage:
          errorMessage == const $CopyWithPlaceholder() || errorMessage == null
              ? _value.errorMessage
              // ignore: cast_nullable_to_non_nullable
              : errorMessage as String,
    );
  }
}

extension $PoscanAssetsStateCopyWith on PoscanAssetsState {
  /// Returns a callable class that can be used as follows: `instanceOfPoscanAssetsState.copyWith(...)` or like so:`instanceOfPoscanAssetsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PoscanAssetsStateCWProxy get copyWith =>
      _$PoscanAssetsStateCWProxyImpl(this);
}
