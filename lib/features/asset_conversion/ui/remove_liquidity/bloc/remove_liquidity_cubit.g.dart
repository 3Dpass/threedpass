// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_liquidity_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RemoveLiquidityStateCWProxy {
  RemoveLiquidityState percentage(int percentage);

  RemoveLiquidityState isLoading(bool isLoading);

  RemoveLiquidityState removeLiquidityInfo(
      RemoveLiquidityInfo? removeLiquidityInfo);

  RemoveLiquidityState maxPercent(int? maxPercent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RemoveLiquidityState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RemoveLiquidityState(...).copyWith(id: 12, name: "My name")
  /// ````
  RemoveLiquidityState call({
    int? percentage,
    bool? isLoading,
    RemoveLiquidityInfo? removeLiquidityInfo,
    int? maxPercent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRemoveLiquidityState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRemoveLiquidityState.copyWith.fieldName(...)`
class _$RemoveLiquidityStateCWProxyImpl
    implements _$RemoveLiquidityStateCWProxy {
  const _$RemoveLiquidityStateCWProxyImpl(this._value);

  final RemoveLiquidityState _value;

  @override
  RemoveLiquidityState percentage(int percentage) =>
      this(percentage: percentage);

  @override
  RemoveLiquidityState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  RemoveLiquidityState removeLiquidityInfo(
          RemoveLiquidityInfo? removeLiquidityInfo) =>
      this(removeLiquidityInfo: removeLiquidityInfo);

  @override
  RemoveLiquidityState maxPercent(int? maxPercent) =>
      this(maxPercent: maxPercent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RemoveLiquidityState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RemoveLiquidityState(...).copyWith(id: 12, name: "My name")
  /// ````
  RemoveLiquidityState call({
    Object? percentage = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? removeLiquidityInfo = const $CopyWithPlaceholder(),
    Object? maxPercent = const $CopyWithPlaceholder(),
  }) {
    return RemoveLiquidityState(
      percentage:
          percentage == const $CopyWithPlaceholder() || percentage == null
              ? _value.percentage
              // ignore: cast_nullable_to_non_nullable
              : percentage as int,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      removeLiquidityInfo: removeLiquidityInfo == const $CopyWithPlaceholder()
          ? _value.removeLiquidityInfo
          // ignore: cast_nullable_to_non_nullable
          : removeLiquidityInfo as RemoveLiquidityInfo?,
      maxPercent: maxPercent == const $CopyWithPlaceholder()
          ? _value.maxPercent
          // ignore: cast_nullable_to_non_nullable
          : maxPercent as int?,
    );
  }
}

extension $RemoveLiquidityStateCopyWith on RemoveLiquidityState {
  /// Returns a callable class that can be used as follows: `instanceOfRemoveLiquidityState.copyWith(...)` or like so:`instanceOfRemoveLiquidityState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RemoveLiquidityStateCWProxy get copyWith =>
      _$RemoveLiquidityStateCWProxyImpl(this);
}
