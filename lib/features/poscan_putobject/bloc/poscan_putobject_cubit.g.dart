// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poscan_putobject_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$D3PRPCCubitStateCWProxy {
  D3PRPCCubitState account(KeyPairData account);

  D3PRPCCubitState chosenHashes(List<String> chosenHashes);

  D3PRPCCubitState chosenProperties(List<PoscanProperty> chosenProperties);

  D3PRPCCubitState chosenCategory(MapPoscanCategory chosenCategory);

  D3PRPCCubitState defaultProperties(List<PoscanProperty> defaultProperties);

  D3PRPCCubitState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `D3PRPCCubitState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// D3PRPCCubitState(...).copyWith(id: 12, name: "My name")
  /// ````
  D3PRPCCubitState call({
    KeyPairData? account,
    List<String>? chosenHashes,
    List<PoscanProperty>? chosenProperties,
    MapPoscanCategory? chosenCategory,
    List<PoscanProperty>? defaultProperties,
    bool? isLoading,
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
  D3PRPCCubitState chosenProperties(List<PoscanProperty> chosenProperties) =>
      this(chosenProperties: chosenProperties);

  @override
  D3PRPCCubitState chosenCategory(MapPoscanCategory chosenCategory) =>
      this(chosenCategory: chosenCategory);

  @override
  D3PRPCCubitState defaultProperties(List<PoscanProperty> defaultProperties) =>
      this(defaultProperties: defaultProperties);

  @override
  D3PRPCCubitState isLoading(bool isLoading) => this(isLoading: isLoading);

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
    Object? chosenProperties = const $CopyWithPlaceholder(),
    Object? chosenCategory = const $CopyWithPlaceholder(),
    Object? defaultProperties = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
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
      chosenProperties: chosenProperties == const $CopyWithPlaceholder() ||
              chosenProperties == null
          ? _value.chosenProperties
          // ignore: cast_nullable_to_non_nullable
          : chosenProperties as List<PoscanProperty>,
      chosenCategory: chosenCategory == const $CopyWithPlaceholder() ||
              chosenCategory == null
          ? _value.chosenCategory
          // ignore: cast_nullable_to_non_nullable
          : chosenCategory as MapPoscanCategory,
      defaultProperties: defaultProperties == const $CopyWithPlaceholder() ||
              defaultProperties == null
          ? _value.defaultProperties
          // ignore: cast_nullable_to_non_nullable
          : defaultProperties as List<PoscanProperty>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $D3PRPCCubitStateCopyWith on D3PRPCCubitState {
  /// Returns a callable class that can be used as follows: `instanceOfD3PRPCCubitState.copyWith(...)` or like so:`instanceOfD3PRPCCubitState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$D3PRPCCubitStateCWProxy get copyWith => _$D3PRPCCubitStateCWProxyImpl(this);
}
