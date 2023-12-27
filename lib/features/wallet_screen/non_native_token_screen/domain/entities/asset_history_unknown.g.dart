// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history_unknown.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AssetHistoryUnkownCWProxy {
  AssetHistoryUnkown blockDatetime(DateTime blockDatetime);

  AssetHistoryUnkown extrinsicIdx(int extrinsicIdx);

  AssetHistoryUnkown authorAddress(String authorAddress);

  AssetHistoryUnkown arguments(String arguments);

  AssetHistoryUnkown callModule(String callModule);

  AssetHistoryUnkown extrisincStatus(ExtrinsicStatus extrisincStatus);

  AssetHistoryUnkown blockNumber(int blockNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryUnkown(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryUnkown(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryUnkown call({
    DateTime? blockDatetime,
    int? extrinsicIdx,
    String? authorAddress,
    String? arguments,
    String? callModule,
    ExtrinsicStatus? extrisincStatus,
    int? blockNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssetHistoryUnkown.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssetHistoryUnkown.copyWith.fieldName(...)`
class _$AssetHistoryUnkownCWProxyImpl implements _$AssetHistoryUnkownCWProxy {
  const _$AssetHistoryUnkownCWProxyImpl(this._value);

  final AssetHistoryUnkown _value;

  @override
  AssetHistoryUnkown blockDatetime(DateTime blockDatetime) =>
      this(blockDatetime: blockDatetime);

  @override
  AssetHistoryUnkown extrinsicIdx(int extrinsicIdx) =>
      this(extrinsicIdx: extrinsicIdx);

  @override
  AssetHistoryUnkown authorAddress(String authorAddress) =>
      this(authorAddress: authorAddress);

  @override
  AssetHistoryUnkown arguments(String arguments) => this(arguments: arguments);

  @override
  AssetHistoryUnkown callModule(String callModule) =>
      this(callModule: callModule);

  @override
  AssetHistoryUnkown extrisincStatus(ExtrinsicStatus extrisincStatus) =>
      this(extrisincStatus: extrisincStatus);

  @override
  AssetHistoryUnkown blockNumber(int blockNumber) =>
      this(blockNumber: blockNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryUnkown(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryUnkown(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryUnkown call({
    Object? blockDatetime = const $CopyWithPlaceholder(),
    Object? extrinsicIdx = const $CopyWithPlaceholder(),
    Object? authorAddress = const $CopyWithPlaceholder(),
    Object? arguments = const $CopyWithPlaceholder(),
    Object? callModule = const $CopyWithPlaceholder(),
    Object? extrisincStatus = const $CopyWithPlaceholder(),
    Object? blockNumber = const $CopyWithPlaceholder(),
  }) {
    return AssetHistoryUnkown(
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
      arguments: arguments == const $CopyWithPlaceholder() || arguments == null
          ? _value.arguments
          // ignore: cast_nullable_to_non_nullable
          : arguments as String,
      callModule:
          callModule == const $CopyWithPlaceholder() || callModule == null
              ? _value.callModule
              // ignore: cast_nullable_to_non_nullable
              : callModule as String,
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

extension $AssetHistoryUnkownCopyWith on AssetHistoryUnkown {
  /// Returns a callable class that can be used as follows: `instanceOfAssetHistoryUnkown.copyWith(...)` or like so:`instanceOfAssetHistoryUnkown.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssetHistoryUnkownCWProxy get copyWith =>
      _$AssetHistoryUnkownCWProxyImpl(this);
}
