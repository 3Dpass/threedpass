// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'either.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EitherTearOff {
  const _$EitherTearOff();

  _Left<L, R> left<L, R>(L value) {
    return _Left<L, R>(
      value,
    );
  }

  _Right<L, R> right<L, R>(R value) {
    return _Right<L, R>(
      value,
    );
  }
}

/// @nodoc
const $Either = _$EitherTearOff();

/// @nodoc
mixin _$Either<L, R> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) left,
    required TResult Function(R value) right,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(L value)? left,
    TResult Function(R value)? right,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? left,
    TResult Function(R value)? right,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Left<L, R> value) left,
    required TResult Function(_Right<L, R> value) right,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? left,
    TResult Function(_Right<L, R> value)? right,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? left,
    TResult Function(_Right<L, R> value)? right,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EitherCopyWith<L, R, $Res> {
  factory $EitherCopyWith(
          Either<L, R> value, $Res Function(Either<L, R>) then) =
      _$EitherCopyWithImpl<L, R, $Res>;
}

/// @nodoc
class _$EitherCopyWithImpl<L, R, $Res> implements $EitherCopyWith<L, R, $Res> {
  _$EitherCopyWithImpl(this._value, this._then);

  final Either<L, R> _value;
  // ignore: unused_field
  final $Res Function(Either<L, R>) _then;
}

/// @nodoc
abstract class _$LeftCopyWith<L, R, $Res> {
  factory _$LeftCopyWith(_Left<L, R> value, $Res Function(_Left<L, R>) then) =
      __$LeftCopyWithImpl<L, R, $Res>;
  $Res call({L value});
}

/// @nodoc
class __$LeftCopyWithImpl<L, R, $Res> extends _$EitherCopyWithImpl<L, R, $Res>
    implements _$LeftCopyWith<L, R, $Res> {
  __$LeftCopyWithImpl(_Left<L, R> _value, $Res Function(_Left<L, R>) _then)
      : super(_value, (v) => _then(v as _Left<L, R>));

  @override
  _Left<L, R> get _value => super._value as _Left<L, R>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_Left<L, R>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as L,
    ));
  }
}

/// @nodoc

class _$_Left<L, R> implements _Left<L, R> {
  const _$_Left(this.value);

  @override
  final L value;

  @override
  String toString() {
    return 'Either<$L, $R>.left(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Left<L, R> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$LeftCopyWith<L, R, _Left<L, R>> get copyWith =>
      __$LeftCopyWithImpl<L, R, _Left<L, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) left,
    required TResult Function(R value) right,
  }) {
    return left(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(L value)? left,
    TResult Function(R value)? right,
  }) {
    return left?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? left,
    TResult Function(R value)? right,
    required TResult orElse(),
  }) {
    if (left != null) {
      return left(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Left<L, R> value) left,
    required TResult Function(_Right<L, R> value) right,
  }) {
    return left(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? left,
    TResult Function(_Right<L, R> value)? right,
  }) {
    return left?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? left,
    TResult Function(_Right<L, R> value)? right,
    required TResult orElse(),
  }) {
    if (left != null) {
      return left(this);
    }
    return orElse();
  }
}

abstract class _Left<L, R> implements Either<L, R> {
  const factory _Left(L value) = _$_Left<L, R>;

  L get value;
  @JsonKey(ignore: true)
  _$LeftCopyWith<L, R, _Left<L, R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RightCopyWith<L, R, $Res> {
  factory _$RightCopyWith(
          _Right<L, R> value, $Res Function(_Right<L, R>) then) =
      __$RightCopyWithImpl<L, R, $Res>;
  $Res call({R value});
}

/// @nodoc
class __$RightCopyWithImpl<L, R, $Res> extends _$EitherCopyWithImpl<L, R, $Res>
    implements _$RightCopyWith<L, R, $Res> {
  __$RightCopyWithImpl(_Right<L, R> _value, $Res Function(_Right<L, R>) _then)
      : super(_value, (v) => _then(v as _Right<L, R>));

  @override
  _Right<L, R> get _value => super._value as _Right<L, R>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_Right<L, R>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$_Right<L, R> implements _Right<L, R> {
  const _$_Right(this.value);

  @override
  final R value;

  @override
  String toString() {
    return 'Either<$L, $R>.right(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Right<L, R> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$RightCopyWith<L, R, _Right<L, R>> get copyWith =>
      __$RightCopyWithImpl<L, R, _Right<L, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) left,
    required TResult Function(R value) right,
  }) {
    return right(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(L value)? left,
    TResult Function(R value)? right,
  }) {
    return right?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? left,
    TResult Function(R value)? right,
    required TResult orElse(),
  }) {
    if (right != null) {
      return right(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Left<L, R> value) left,
    required TResult Function(_Right<L, R> value) right,
  }) {
    return right(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? left,
    TResult Function(_Right<L, R> value)? right,
  }) {
    return right?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Left<L, R> value)? left,
    TResult Function(_Right<L, R> value)? right,
    required TResult orElse(),
  }) {
    if (right != null) {
      return right(this);
    }
    return orElse();
  }
}

abstract class _Right<L, R> implements Either<L, R> {
  const factory _Right(R value) = _$_Right<L, R>;

  R get value;
  @JsonKey(ignore: true)
  _$RightCopyWith<L, R, _Right<L, R>> get copyWith =>
      throw _privateConstructorUsedError;
}
