// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AssetHistoryCreateCWProxy {
  AssetHistoryCreate blockDatetime(DateTime blockDatetime);

  AssetHistoryCreate extrinsicIdx(int extrinsicIdx);

  AssetHistoryCreate authorAddress(String authorAddress);

  AssetHistoryCreate extrisincStatus(ExtrinsicStatus extrisincStatus);

  AssetHistoryCreate blockNumber(int blockNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryCreate call({
    DateTime? blockDatetime,
    int? extrinsicIdx,
    String? authorAddress,
    ExtrinsicStatus? extrisincStatus,
    int? blockNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssetHistoryCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssetHistoryCreate.copyWith.fieldName(...)`
class _$AssetHistoryCreateCWProxyImpl implements _$AssetHistoryCreateCWProxy {
  const _$AssetHistoryCreateCWProxyImpl(this._value);

  final AssetHistoryCreate _value;

  @override
  AssetHistoryCreate blockDatetime(DateTime blockDatetime) =>
      this(blockDatetime: blockDatetime);

  @override
  AssetHistoryCreate extrinsicIdx(int extrinsicIdx) =>
      this(extrinsicIdx: extrinsicIdx);

  @override
  AssetHistoryCreate authorAddress(String authorAddress) =>
      this(authorAddress: authorAddress);

  @override
  AssetHistoryCreate extrisincStatus(ExtrinsicStatus extrisincStatus) =>
      this(extrisincStatus: extrisincStatus);

  @override
  AssetHistoryCreate blockNumber(int blockNumber) =>
      this(blockNumber: blockNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryCreate call({
    Object? blockDatetime = const $CopyWithPlaceholder(),
    Object? extrinsicIdx = const $CopyWithPlaceholder(),
    Object? authorAddress = const $CopyWithPlaceholder(),
    Object? extrisincStatus = const $CopyWithPlaceholder(),
    Object? blockNumber = const $CopyWithPlaceholder(),
  }) {
    return AssetHistoryCreate(
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
      authorAddress:
          authorAddress == const $CopyWithPlaceholder() || authorAddress == null
              ? _value.authorAddress
              // ignore: cast_nullable_to_non_nullable
              : authorAddress as String,
      extrisincStatus: extrisincStatus == const $CopyWithPlaceholder() ||
              extrisincStatus == null
          ? _value.extrisincStatus
          // ignore: cast_nullable_to_non_nullable
          : extrisincStatus as ExtrinsicStatus,
      blockNumber:
          blockNumber == const $CopyWithPlaceholder() || blockNumber == null
              ? _value.blockNumber
              // ignore: cast_nullable_to_non_nullable
              : blockNumber as int,
    );
  }
}

extension $AssetHistoryCreateCopyWith on AssetHistoryCreate {
  /// Returns a callable class that can be used as follows: `instanceOfAssetHistoryCreate.copyWith(...)` or like so:`instanceOfAssetHistoryCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssetHistoryCreateCWProxy get copyWith =>
      _$AssetHistoryCreateCWProxyImpl(this);
}
