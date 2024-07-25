// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_liquidity_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RemveLiquidityStateCWProxy {
  RemveLiquidityState percentage(int percentage);

  RemveLiquidityState isLoading(bool isLoading);

  RemveLiquidityState removeLiquidityInfo(
      RemoveLiquidityInfo? removeLiquidityInfo);

  RemveLiquidityState maxPercent(int? maxPercent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RemveLiquidityState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RemveLiquidityState(...).copyWith(id: 12, name: "My name")
  /// ````
  RemveLiquidityState call({
    int? percentage,
    bool? isLoading,
    RemoveLiquidityInfo? removeLiquidityInfo,
    int? maxPercent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRemveLiquidityState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRemveLiquidityState.copyWith.fieldName(...)`
class _$RemveLiquidityStateCWProxyImpl implements _$RemveLiquidityStateCWProxy {
  const _$RemveLiquidityStateCWProxyImpl(this._value);

  final RemveLiquidityState _value;

  @override
  RemveLiquidityState percentage(int percentage) =>
      this(percentage: percentage);

  @override
  RemveLiquidityState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  RemveLiquidityState removeLiquidityInfo(
          RemoveLiquidityInfo? removeLiquidityInfo) =>
      this(removeLiquidityInfo: removeLiquidityInfo);

  @override
  RemveLiquidityState maxPercent(int? maxPercent) =>
      this(maxPercent: maxPercent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RemveLiquidityState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RemveLiquidityState(...).copyWith(id: 12, name: "My name")
  /// ````
  RemveLiquidityState call({
    Object? percentage = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? removeLiquidityInfo = const $CopyWithPlaceholder(),
    Object? maxPercent = const $CopyWithPlaceholder(),
  }) {
    return RemveLiquidityState(
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

extension $RemveLiquidityStateCopyWith on RemveLiquidityState {
  /// Returns a callable class that can be used as follows: `instanceOfRemveLiquidityState.copyWith(...)` or like so:`instanceOfRemveLiquidityState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RemveLiquidityStateCWProxy get copyWith =>
      _$RemveLiquidityStateCWProxyImpl(this);
}
