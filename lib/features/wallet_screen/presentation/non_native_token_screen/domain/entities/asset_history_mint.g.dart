// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history_mint.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AssetHistoryMintCWProxy {
  AssetHistoryMint authorAddress(String authorAddress);

  AssetHistoryMint blockDatetime(DateTime blockDatetime);

  AssetHistoryMint extrinsicIdx(int extrinsicIdx);

  AssetHistoryMint extrisincStatus(ExtrisincStatus extrisincStatus);

  AssetHistoryMint value(String value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryMint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryMint(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryMint call({
    String? authorAddress,
    DateTime? blockDatetime,
    int? extrinsicIdx,
    ExtrisincStatus? extrisincStatus,
    String? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssetHistoryMint.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssetHistoryMint.copyWith.fieldName(...)`
class _$AssetHistoryMintCWProxyImpl implements _$AssetHistoryMintCWProxy {
  final AssetHistoryMint _value;

  const _$AssetHistoryMintCWProxyImpl(this._value);

  @override
  AssetHistoryMint authorAddress(String authorAddress) =>
      this(authorAddress: authorAddress);

  @override
  AssetHistoryMint blockDatetime(DateTime blockDatetime) =>
      this(blockDatetime: blockDatetime);

  @override
  AssetHistoryMint extrinsicIdx(int extrinsicIdx) =>
      this(extrinsicIdx: extrinsicIdx);

  @override
  AssetHistoryMint extrisincStatus(ExtrisincStatus extrisincStatus) =>
      this(extrisincStatus: extrisincStatus);

  @override
  AssetHistoryMint value(String value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryMint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryMint(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryMint call({
    Object? authorAddress = const $CopyWithPlaceholder(),
    Object? blockDatetime = const $CopyWithPlaceholder(),
    Object? extrinsicIdx = const $CopyWithPlaceholder(),
    Object? extrisincStatus = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return AssetHistoryMint(
      authorAddress:
          authorAddress == const $CopyWithPlaceholder() || authorAddress == null
              ? _value.authorAddress
              // ignore: cast_nullable_to_non_nullable
              : authorAddress as String,
      blockDatetime:
          blockDatetime == const $CopyWithPlaceholder() || blockDatetime == null
              ? _value.blockDatetime
              // ignore: cast_nullable_to_non_nullable
              : blockDatetime as DateTime,
      extrinsicIdx:
          extrinsicIdx == const $CopyWithPlaceholder() || extrinsicIdx == null
              ? _value.extrinsicIdx
              // ignore: cast_nullable_to_non_nullable
              : extrinsicIdx as int,
      extrisincStatus: extrisincStatus == const $CopyWithPlaceholder() ||
              extrisincStatus == null
          ? _value.extrisincStatus
          // ignore: cast_nullable_to_non_nullable
          : extrisincStatus as ExtrisincStatus,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String,
    );
  }
}

extension $AssetHistoryMintCopyWith on AssetHistoryMint {
  /// Returns a callable class that can be used as follows: `instanceOfAssetHistoryMint.copyWith(...)` or like so:`instanceOfAssetHistoryMint.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssetHistoryMintCWProxy get copyWith => _$AssetHistoryMintCWProxyImpl(this);
}
