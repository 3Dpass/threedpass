// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pool_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreatePoolStateCWProxy {
  CreatePoolState asset1(PoolAssetField asset1);

  CreatePoolState asset2(PoolAssetField asset2);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePoolState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePoolState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePoolState call({
    PoolAssetField? asset1,
    PoolAssetField? asset2,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreatePoolState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreatePoolState.copyWith.fieldName(...)`
class _$CreatePoolStateCWProxyImpl implements _$CreatePoolStateCWProxy {
  const _$CreatePoolStateCWProxyImpl(this._value);

  final CreatePoolState _value;

  @override
  CreatePoolState asset1(PoolAssetField asset1) => this(asset1: asset1);

  @override
  CreatePoolState asset2(PoolAssetField asset2) => this(asset2: asset2);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePoolState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePoolState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePoolState call({
    Object? asset1 = const $CopyWithPlaceholder(),
    Object? asset2 = const $CopyWithPlaceholder(),
  }) {
    return CreatePoolState(
      asset1: asset1 == const $CopyWithPlaceholder() || asset1 == null
          ? _value.asset1
          // ignore: cast_nullable_to_non_nullable
          : asset1 as PoolAssetField,
      asset2: asset2 == const $CopyWithPlaceholder() || asset2 == null
          ? _value.asset2
          // ignore: cast_nullable_to_non_nullable
          : asset2 as PoolAssetField,
    );
  }
}

extension $CreatePoolStateCopyWith on CreatePoolState {
  /// Returns a callable class that can be used as follows: `instanceOfCreatePoolState.copyWith(...)` or like so:`instanceOfCreatePoolState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreatePoolStateCWProxy get copyWith => _$CreatePoolStateCWProxyImpl(this);
}
