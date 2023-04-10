// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history_set_meta_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AssetHistorySetMetadataCWProxy {
  AssetHistorySetMetadata authorAddress(String authorAddress);

  AssetHistorySetMetadata blockDatetime(DateTime blockDatetime);

  AssetHistorySetMetadata decimals(String decimals);

  AssetHistorySetMetadata extrinsicIdx(int extrinsicIdx);

  AssetHistorySetMetadata extrisincStatus(ExtrisincStatus extrisincStatus);

  AssetHistorySetMetadata name(String name);

  AssetHistorySetMetadata symbol(String symbol);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistorySetMetadata(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistorySetMetadata(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistorySetMetadata call({
    String? authorAddress,
    DateTime? blockDatetime,
    String? decimals,
    int? extrinsicIdx,
    ExtrisincStatus? extrisincStatus,
    String? name,
    String? symbol,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssetHistorySetMetadata.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssetHistorySetMetadata.copyWith.fieldName(...)`
class _$AssetHistorySetMetadataCWProxyImpl
    implements _$AssetHistorySetMetadataCWProxy {
  final AssetHistorySetMetadata _value;

  const _$AssetHistorySetMetadataCWProxyImpl(this._value);

  @override
  AssetHistorySetMetadata authorAddress(String authorAddress) =>
      this(authorAddress: authorAddress);

  @override
  AssetHistorySetMetadata blockDatetime(DateTime blockDatetime) =>
      this(blockDatetime: blockDatetime);

  @override
  AssetHistorySetMetadata decimals(String decimals) => this(decimals: decimals);

  @override
  AssetHistorySetMetadata extrinsicIdx(int extrinsicIdx) =>
      this(extrinsicIdx: extrinsicIdx);

  @override
  AssetHistorySetMetadata extrisincStatus(ExtrisincStatus extrisincStatus) =>
      this(extrisincStatus: extrisincStatus);

  @override
  AssetHistorySetMetadata name(String name) => this(name: name);

  @override
  AssetHistorySetMetadata symbol(String symbol) => this(symbol: symbol);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistorySetMetadata(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistorySetMetadata(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistorySetMetadata call({
    Object? authorAddress = const $CopyWithPlaceholder(),
    Object? blockDatetime = const $CopyWithPlaceholder(),
    Object? decimals = const $CopyWithPlaceholder(),
    Object? extrinsicIdx = const $CopyWithPlaceholder(),
    Object? extrisincStatus = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? symbol = const $CopyWithPlaceholder(),
  }) {
    return AssetHistorySetMetadata(
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
      decimals: decimals == const $CopyWithPlaceholder() || decimals == null
          ? _value.decimals
          // ignore: cast_nullable_to_non_nullable
          : decimals as String,
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
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      symbol: symbol == const $CopyWithPlaceholder() || symbol == null
          ? _value.symbol
          // ignore: cast_nullable_to_non_nullable
          : symbol as String,
    );
  }
}

extension $AssetHistorySetMetadataCopyWith on AssetHistorySetMetadata {
  /// Returns a callable class that can be used as follows: `instanceOfAssetHistorySetMetadata.copyWith(...)` or like so:`instanceOfAssetHistorySetMetadata.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssetHistorySetMetadataCWProxy get copyWith =>
      _$AssetHistorySetMetadataCWProxyImpl(this);
}
