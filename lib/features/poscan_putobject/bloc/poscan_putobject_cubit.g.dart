// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poscan_putobject_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$D3PRPCCubitStateCWProxy {
  D3PRPCCubitState account(KeyPairData account);

  D3PRPCCubitState chosenHashes(List<String> chosenHashes);

  D3PRPCCubitState properties(List<PoscanProperty> properties);

  D3PRPCCubitState chosenCategory(MapPoscanCategory chosenCategory);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `D3PRPCCubitState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// D3PRPCCubitState(...).copyWith(id: 12, name: "My name")
  /// ````
  D3PRPCCubitState call({
    KeyPairData? account,
    List<String>? chosenHashes,
    List<PoscanProperty>? properties,
    MapPoscanCategory? chosenCategory,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfD3PRPCCubitState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfD3PRPCCubitState.copyWith.fieldName(...)`
class _$D3PRPCCubitStateCWProxyImpl implements _$D3PRPCCubitStateCWProxy {
  const _$D3PRPCCubitStateCWProxyImpl(this._value);

  final D3PRPCCubitState _value;

  @override
  D3PRPCCubitState account(KeyPairData account) => this(account: account);

  @override
  D3PRPCCubitState chosenHashes(List<String> chosenHashes) =>
      this(chosenHashes: chosenHashes);

  @override
  D3PRPCCubitState properties(List<PoscanProperty> properties) =>
      this(properties: properties);

  @override
  D3PRPCCubitState chosenCategory(MapPoscanCategory chosenCategory) =>
      this(chosenCategory: chosenCategory);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `D3PRPCCubitState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// D3PRPCCubitState(...).copyWith(id: 12, name: "My name")
  /// ````
  D3PRPCCubitState call({
    Object? account = const $CopyWithPlaceholder(),
    Object? chosenHashes = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? chosenCategory = const $CopyWithPlaceholder(),
  }) {
    return D3PRPCCubitState(
      account: account == const $CopyWithPlaceholder() || account == null
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as KeyPairData,
      chosenHashes:
          chosenHashes == const $CopyWithPlaceholder() || chosenHashes == null
              ? _value.chosenHashes
              // ignore: cast_nullable_to_non_nullable
              : chosenHashes as List<String>,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as List<PoscanProperty>,
      chosenCategory: chosenCategory == const $CopyWithPlaceholder() ||
              chosenCategory == null
          ? _value.chosenCategory
          // ignore: cast_nullable_to_non_nullable
          : chosenCategory as MapPoscanCategory,
    );
  }
}

extension $D3PRPCCubitStateCopyWith on D3PRPCCubitState {
  /// Returns a callable class that can be used as follows: `instanceOfD3PRPCCubitState.copyWith(...)` or like so:`instanceOfD3PRPCCubitState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$D3PRPCCubitStateCWProxy get copyWith => _$D3PRPCCubitStateCWProxyImpl(this);
}
