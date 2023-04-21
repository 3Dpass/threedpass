// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history_transfer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AssetHistoryTransferCWProxy {
  AssetHistoryTransfer authorAddress(String authorAddress);

  AssetHistoryTransfer blockDatetime(DateTime blockDatetime);

  AssetHistoryTransfer blockNumber(int blockNumber);

  AssetHistoryTransfer decimals(int decimals);

  AssetHistoryTransfer extrinsicIdx(int extrinsicIdx);

  AssetHistoryTransfer extrisincStatus(ExtrisincStatus extrisincStatus);

  AssetHistoryTransfer isFrom(bool isFrom);

  AssetHistoryTransfer symbols(String symbols);

  AssetHistoryTransfer targetAddress(String targetAddress);

  AssetHistoryTransfer value(String value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryTransfer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryTransfer(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryTransfer call({
    String? authorAddress,
    DateTime? blockDatetime,
    int? blockNumber,
    int? decimals,
    int? extrinsicIdx,
    ExtrisincStatus? extrisincStatus,
    bool? isFrom,
    String? symbols,
    String? targetAddress,
    String? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssetHistoryTransfer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssetHistoryTransfer.copyWith.fieldName(...)`
class _$AssetHistoryTransferCWProxyImpl
    implements _$AssetHistoryTransferCWProxy {
  final AssetHistoryTransfer _value;

  const _$AssetHistoryTransferCWProxyImpl(this._value);

  @override
  AssetHistoryTransfer authorAddress(String authorAddress) =>
      this(authorAddress: authorAddress);

  @override
  AssetHistoryTransfer blockDatetime(DateTime blockDatetime) =>
      this(blockDatetime: blockDatetime);

  @override
  AssetHistoryTransfer blockNumber(int blockNumber) =>
      this(blockNumber: blockNumber);

  @override
  AssetHistoryTransfer decimals(int decimals) => this(decimals: decimals);

  @override
  AssetHistoryTransfer extrinsicIdx(int extrinsicIdx) =>
      this(extrinsicIdx: extrinsicIdx);

  @override
  AssetHistoryTransfer extrisincStatus(ExtrisincStatus extrisincStatus) =>
      this(extrisincStatus: extrisincStatus);

  @override
  AssetHistoryTransfer isFrom(bool isFrom) => this(isFrom: isFrom);

  @override
  AssetHistoryTransfer symbols(String symbols) => this(symbols: symbols);

  @override
  AssetHistoryTransfer targetAddress(String targetAddress) =>
      this(targetAddress: targetAddress);

  @override
  AssetHistoryTransfer value(String value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryTransfer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryTransfer(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryTransfer call({
    Object? authorAddress = const $CopyWithPlaceholder(),
    Object? blockDatetime = const $CopyWithPlaceholder(),
    Object? blockNumber = const $CopyWithPlaceholder(),
    Object? decimals = const $CopyWithPlaceholder(),
    Object? extrinsicIdx = const $CopyWithPlaceholder(),
    Object? extrisincStatus = const $CopyWithPlaceholder(),
    Object? isFrom = const $CopyWithPlaceholder(),
    Object? symbols = const $CopyWithPlaceholder(),
    Object? targetAddress = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return AssetHistoryTransfer(
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
      blockNumber:
          blockNumber == const $CopyWithPlaceholder() || blockNumber == null
              ? _value.blockNumber
              // ignore: cast_nullable_to_non_nullable
              : blockNumber as int,
      decimals: decimals == const $CopyWithPlaceholder() || decimals == null
          ? _value.decimals
          // ignore: cast_nullable_to_non_nullable
          : decimals as int,
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
      isFrom: isFrom == const $CopyWithPlaceholder() || isFrom == null
          ? _value.isFrom
          // ignore: cast_nullable_to_non_nullable
          : isFrom as bool,
      symbols: symbols == const $CopyWithPlaceholder() || symbols == null
          ? _value.symbols
          // ignore: cast_nullable_to_non_nullable
          : symbols as String,
      targetAddress:
          targetAddress == const $CopyWithPlaceholder() || targetAddress == null
              ? _value.targetAddress
              // ignore: cast_nullable_to_non_nullable
              : targetAddress as String,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String,
    );
  }
}

extension $AssetHistoryTransferCopyWith on AssetHistoryTransfer {
  /// Returns a callable class that can be used as follows: `instanceOfAssetHistoryTransfer.copyWith(...)` or like so:`instanceOfAssetHistoryTransfer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssetHistoryTransferCWProxy get copyWith =>
      _$AssetHistoryTransferCWProxyImpl(this);
}
