// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swap_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SwapState {
  PoolAssetField get firstAsset => throw _privateConstructorUsedError;
  PoolAssetField get secondAsset => throw _privateConstructorUsedError;
  SwapMethod get chosenMethod => throw _privateConstructorUsedError;
  bool get keepAlive => throw _privateConstructorUsedError;
  Decimal? get slippageValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwapStateCopyWith<SwapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapStateCopyWith<$Res> {
  factory $SwapStateCopyWith(SwapState value, $Res Function(SwapState) then) =
      _$SwapStateCopyWithImpl<$Res, SwapState>;
  @useResult
  $Res call(
      {PoolAssetField firstAsset,
      PoolAssetField secondAsset,
      SwapMethod chosenMethod,
      bool keepAlive,
      Decimal? slippageValue});
}

/// @nodoc
class _$SwapStateCopyWithImpl<$Res, $Val extends SwapState>
    implements $SwapStateCopyWith<$Res> {
  _$SwapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstAsset = null,
    Object? secondAsset = null,
    Object? chosenMethod = null,
    Object? keepAlive = null,
    Object? slippageValue = freezed,
  }) {
    return _then(_value.copyWith(
      firstAsset: null == firstAsset
          ? _value.firstAsset
          : firstAsset // ignore: cast_nullable_to_non_nullable
              as PoolAssetField,
      secondAsset: null == secondAsset
          ? _value.secondAsset
          : secondAsset // ignore: cast_nullable_to_non_nullable
              as PoolAssetField,
      chosenMethod: null == chosenMethod
          ? _value.chosenMethod
          : chosenMethod // ignore: cast_nullable_to_non_nullable
              as SwapMethod,
      keepAlive: null == keepAlive
          ? _value.keepAlive
          : keepAlive // ignore: cast_nullable_to_non_nullable
              as bool,
      slippageValue: freezed == slippageValue
          ? _value.slippageValue
          : slippageValue // ignore: cast_nullable_to_non_nullable
              as Decimal?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwapStateImplCopyWith<$Res>
    implements $SwapStateCopyWith<$Res> {
  factory _$$SwapStateImplCopyWith(
          _$SwapStateImpl value, $Res Function(_$SwapStateImpl) then) =
      __$$SwapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PoolAssetField firstAsset,
      PoolAssetField secondAsset,
      SwapMethod chosenMethod,
      bool keepAlive,
      Decimal? slippageValue});
}

/// @nodoc
class __$$SwapStateImplCopyWithImpl<$Res>
    extends _$SwapStateCopyWithImpl<$Res, _$SwapStateImpl>
    implements _$$SwapStateImplCopyWith<$Res> {
  __$$SwapStateImplCopyWithImpl(
      _$SwapStateImpl _value, $Res Function(_$SwapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstAsset = null,
    Object? secondAsset = null,
    Object? chosenMethod = null,
    Object? keepAlive = null,
    Object? slippageValue = freezed,
  }) {
    return _then(_$SwapStateImpl(
      firstAsset: null == firstAsset
          ? _value.firstAsset
          : firstAsset // ignore: cast_nullable_to_non_nullable
              as PoolAssetField,
      secondAsset: null == secondAsset
          ? _value.secondAsset
          : secondAsset // ignore: cast_nullable_to_non_nullable
              as PoolAssetField,
      chosenMethod: null == chosenMethod
          ? _value.chosenMethod
          : chosenMethod // ignore: cast_nullable_to_non_nullable
              as SwapMethod,
      keepAlive: null == keepAlive
          ? _value.keepAlive
          : keepAlive // ignore: cast_nullable_to_non_nullable
              as bool,
      slippageValue: freezed == slippageValue
          ? _value.slippageValue
          : slippageValue // ignore: cast_nullable_to_non_nullable
              as Decimal?,
    ));
  }
}

/// @nodoc

class _$SwapStateImpl implements _SwapState {
  const _$SwapStateImpl(
      {required this.firstAsset,
      required this.secondAsset,
      required this.chosenMethod,
      required this.keepAlive,
      required this.slippageValue});

  @override
  final PoolAssetField firstAsset;
  @override
  final PoolAssetField secondAsset;
  @override
  final SwapMethod chosenMethod;
  @override
  final bool keepAlive;
  @override
  final Decimal? slippageValue;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapStateImplCopyWith<_$SwapStateImpl> get copyWith =>
      __$$SwapStateImplCopyWithImpl<_$SwapStateImpl>(this, _$identity);
}

abstract class _SwapState implements SwapState {
  const factory _SwapState(
      {required final PoolAssetField firstAsset,
      required final PoolAssetField secondAsset,
      required final SwapMethod chosenMethod,
      required final bool keepAlive,
      required final Decimal? slippageValue}) = _$SwapStateImpl;

  @override
  PoolAssetField get firstAsset;
  @override
  PoolAssetField get secondAsset;
  @override
  SwapMethod get chosenMethod;
  @override
  bool get keepAlive;
  @override
  Decimal? get slippageValue;
  @override
  @JsonKey(ignore: true)
  _$$SwapStateImplCopyWith<_$SwapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
