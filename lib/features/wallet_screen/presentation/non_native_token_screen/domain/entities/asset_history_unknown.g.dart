// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_history_unknown.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AssetHistoryUnkownCWProxy {
  AssetHistoryUnkown arguments(String arguments);

  AssetHistoryUnkown authorAddress(String authorAddress);

  AssetHistoryUnkown blockDatetime(DateTime blockDatetime);

  AssetHistoryUnkown callModule(String callModule);

  AssetHistoryUnkown extrinsicIdx(int extrinsicIdx);

  AssetHistoryUnkown extrisincStatus(ExtrisincStatus extrisincStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryUnkown(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryUnkown(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryUnkown call({
    String? arguments,
    String? authorAddress,
    DateTime? blockDatetime,
    String? callModule,
    int? extrinsicIdx,
    ExtrisincStatus? extrisincStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssetHistoryUnkown.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssetHistoryUnkown.copyWith.fieldName(...)`
class _$AssetHistoryUnkownCWProxyImpl implements _$AssetHistoryUnkownCWProxy {
  final AssetHistoryUnkown _value;

  const _$AssetHistoryUnkownCWProxyImpl(this._value);

  @override
  AssetHistoryUnkown arguments(String arguments) => this(arguments: arguments);

  @override
  AssetHistoryUnkown authorAddress(String authorAddress) =>
      this(authorAddress: authorAddress);

  @override
  AssetHistoryUnkown blockDatetime(DateTime blockDatetime) =>
      this(blockDatetime: blockDatetime);

  @override
  AssetHistoryUnkown callModule(String callModule) =>
      this(callModule: callModule);

  @override
  AssetHistoryUnkown extrinsicIdx(int extrinsicIdx) =>
      this(extrinsicIdx: extrinsicIdx);

  @override
  AssetHistoryUnkown extrisincStatus(ExtrisincStatus extrisincStatus) =>
      this(extrisincStatus: extrisincStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssetHistoryUnkown(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssetHistoryUnkown(...).copyWith(id: 12, name: "My name")
  /// ````
  AssetHistoryUnkown call({
    Object? arguments = const $CopyWithPlaceholder(),
    Object? authorAddress = const $CopyWithPlaceholder(),
    Object? blockDatetime = const $CopyWithPlaceholder(),
    Object? callModule = const $CopyWithPlaceholder(),
    Object? extrinsicIdx = const $CopyWithPlaceholder(),
    Object? extrisincStatus = const $CopyWithPlaceholder(),
  }) {
    return AssetHistoryUnkown(
      arguments: arguments == const $CopyWithPlaceholder() || arguments == null
          ? _value.arguments
          // ignore: cast_nullable_to_non_nullable
          : arguments as String,
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
      callModule:
          callModule == const $CopyWithPlaceholder() || callModule == null
              ? _value.callModule
              // ignore: cast_nullable_to_non_nullable
              : callModule as String,
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

extension $AssetHistoryUnkownCopyWith on AssetHistoryUnkown {
  /// Returns a callable class that can be used as follows: `instanceOfAssetHistoryUnkown.copyWith(...)` or like so:`instanceOfAssetHistoryUnkown.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssetHistoryUnkownCWProxy get copyWith =>
      _$AssetHistoryUnkownCWProxyImpl(this);
}
