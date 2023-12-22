// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history_set_meta_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AssetHistorySetMetadataCWProxy {
  AssetHistorySetMetadata blockDatetime(DateTime blockDatetime);

  AssetHistorySetMetadata extrinsicIdx(int extrinsicIdx);

  AssetHistorySetMetadata authorAddress(String authorAddress);

  AssetHistorySetMetadata decimals(String decimals);

  AssetHistorySetMetadata name(String name);

  AssetHistorySetMetadata symbol(String symbol);

  AssetHistorySetMetadata extrisincStatus(ExtrinsicStatus extrisincStatus);

  AssetHistorySetMetadata blockNumber(int blockNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistorySetMetadata(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistorySetMetadata(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistorySetMetadata call({
    DateTime? blockDatetime,
    int? extrinsicIdx,
    String? authorAddress,
    String? decimals,
    String? name,
    String? symbol,
    ExtrinsicStatus? extrisincStatus,
    int? blockNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssetHistorySetMetadata.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssetHistorySetMetadata.copyWith.fieldName(...)`
class _$AssetHistorySetMetadataCWProxyImpl
    implements _$AssetHistorySetMetadataCWProxy {
  const _$AssetHistorySetMetadataCWProxyImpl(this._value);

  final AssetHistorySetMetadata _value;

  @override
  AssetHistorySetMetadata blockDatetime(DateTime blockDatetime) =>
      this(blockDatetime: blockDatetime);

  @override
  AssetHistorySetMetadata extrinsicIdx(int extrinsicIdx) =>
      this(extrinsicIdx: extrinsicIdx);

  @override
  AssetHistorySetMetadata authorAddress(String authorAddress) =>
      this(authorAddress: authorAddress);

  @override
  AssetHistorySetMetadata decimals(String decimals) => this(decimals: decimals);

  @override
  AssetHistorySetMetadata name(String name) => this(name: name);

  @override
  AssetHistorySetMetadata symbol(String symbol) => this(symbol: symbol);

  @override
  AssetHistorySetMetadata extrisincStatus(ExtrinsicStatus extrisincStatus) =>
      this(extrisincStatus: extrisincStatus);

  @override
  AssetHistorySetMetadata blockNumber(int blockNumber) =>
      this(blockNumber: blockNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistorySetMetadata(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistorySetMetadata(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistorySetMetadata call({
    Object? blockDatetime = const $CopyWithPlaceholder(),
    Object? extrinsicIdx = const $CopyWithPlaceholder(),
    Object? authorAddress = const $CopyWithPlaceholder(),
    Object? decimals = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? symbol = const $CopyWithPlaceholder(),
    Object? extrisincStatus = const $CopyWithPlaceholder(),
    Object? blockNumber = const $CopyWithPlaceholder(),
  }) {
    return AssetHistorySetMetadata(
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
      decimals: decimals == const $CopyWithPlaceholder() || decimals == null
          ? _value.decimals
          // ignore: cast_nullable_to_non_nullable
          : decimals as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      symbol: symbol == const $CopyWithPlaceholder() || symbol == null
          ? _value.symbol
          // ignore: cast_nullable_to_non_nullable
          : symbol as String,
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

extension $AssetHistorySetMetadataCopyWith on AssetHistorySetMetadata {
  /// Returns a callable class that can be used as follows: `instanceOfAssetHistorySetMetadata.copyWith(...)` or like so:`instanceOfAssetHistorySetMetadata.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssetHistorySetMetadataCWProxy get copyWith =>
      _$AssetHistorySetMetadataCWProxyImpl(this);
}
