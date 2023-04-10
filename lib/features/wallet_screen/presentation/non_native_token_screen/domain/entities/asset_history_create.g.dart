// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AssetHistoryCreateCWProxy {
  AssetHistoryCreate authorAddress(String authorAddress);

  AssetHistoryCreate blockDatetime(DateTime blockDatetime);

  AssetHistoryCreate extrinsicIdx(int extrinsicIdx);

  AssetHistoryCreate extrisincStatus(ExtrisincStatus extrisincStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryCreate call({
    String? authorAddress,
    DateTime? blockDatetime,
    int? extrinsicIdx,
    ExtrisincStatus? extrisincStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssetHistoryCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssetHistoryCreate.copyWith.fieldName(...)`
class _$AssetHistoryCreateCWProxyImpl implements _$AssetHistoryCreateCWProxy {
  final AssetHistoryCreate _value;

  const _$AssetHistoryCreateCWProxyImpl(this._value);

  @override
  AssetHistoryCreate authorAddress(String authorAddress) =>
      this(authorAddress: authorAddress);

  @override
  AssetHistoryCreate blockDatetime(DateTime blockDatetime) =>
      this(blockDatetime: blockDatetime);

  @override
  AssetHistoryCreate extrinsicIdx(int extrinsicIdx) =>
      this(extrinsicIdx: extrinsicIdx);

  @override
  AssetHistoryCreate extrisincStatus(ExtrisincStatus extrisincStatus) =>
      this(extrisincStatus: extrisincStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryCreate call({
    Object? authorAddress = const $CopyWithPlaceholder(),
    Object? blockDatetime = const $CopyWithPlaceholder(),
    Object? extrinsicIdx = const $CopyWithPlaceholder(),
    Object? extrisincStatus = const $CopyWithPlaceholder(),
  }) {
    return AssetHistoryCreate(
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
    );
  }
}

extension $AssetHistoryCreateCopyWith on AssetHistoryCreate {
  /// Returns a callable class that can be used as follows: `instanceOfAssetHistoryCreate.copyWith(...)` or like so:`instanceOfAssetHistoryCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssetHistoryCreateCWProxy get copyWith =>
      _$AssetHistoryCreateCWProxyImpl(this);
}
