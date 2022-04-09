// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'storage_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StorageErrorTearOff {
  const _$StorageErrorTearOff();

  _ImpossibleOperation impossibleOperation() {
    return const _ImpossibleOperation();
  }

  _NoDataStored noDataStored() {
    return const _NoDataStored();
  }
}

/// @nodoc
const $StorageError = _$StorageErrorTearOff();

/// @nodoc
mixin _$StorageError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() impossibleOperation,
    required TResult Function() noDataStored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? impossibleOperation,
    TResult Function()? noDataStored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? impossibleOperation,
    TResult Function()? noDataStored,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImpossibleOperation value) impossibleOperation,
    required TResult Function(_NoDataStored value) noDataStored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImpossibleOperation value)? impossibleOperation,
    TResult Function(_NoDataStored value)? noDataStored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImpossibleOperation value)? impossibleOperation,
    TResult Function(_NoDataStored value)? noDataStored,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageErrorCopyWith<$Res> {
  factory $StorageErrorCopyWith(
          StorageError value, $Res Function(StorageError) then) =
      _$StorageErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$StorageErrorCopyWithImpl<$Res> implements $StorageErrorCopyWith<$Res> {
  _$StorageErrorCopyWithImpl(this._value, this._then);

  final StorageError _value;
  // ignore: unused_field
  final $Res Function(StorageError) _then;
}

/// @nodoc
abstract class _$ImpossibleOperationCopyWith<$Res> {
  factory _$ImpossibleOperationCopyWith(_ImpossibleOperation value,
          $Res Function(_ImpossibleOperation) then) =
      __$ImpossibleOperationCopyWithImpl<$Res>;
}

/// @nodoc
class __$ImpossibleOperationCopyWithImpl<$Res>
    extends _$StorageErrorCopyWithImpl<$Res>
    implements _$ImpossibleOperationCopyWith<$Res> {
  __$ImpossibleOperationCopyWithImpl(
      _ImpossibleOperation _value, $Res Function(_ImpossibleOperation) _then)
      : super(_value, (v) => _then(v as _ImpossibleOperation));

  @override
  _ImpossibleOperation get _value => super._value as _ImpossibleOperation;
}

/// @nodoc

class _$_ImpossibleOperation implements _ImpossibleOperation {
  const _$_ImpossibleOperation();

  @override
  String toString() {
    return 'StorageError.impossibleOperation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ImpossibleOperation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() impossibleOperation,
    required TResult Function() noDataStored,
  }) {
    return impossibleOperation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? impossibleOperation,
    TResult Function()? noDataStored,
  }) {
    return impossibleOperation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? impossibleOperation,
    TResult Function()? noDataStored,
    required TResult orElse(),
  }) {
    if (impossibleOperation != null) {
      return impossibleOperation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImpossibleOperation value) impossibleOperation,
    required TResult Function(_NoDataStored value) noDataStored,
  }) {
    return impossibleOperation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImpossibleOperation value)? impossibleOperation,
    TResult Function(_NoDataStored value)? noDataStored,
  }) {
    return impossibleOperation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImpossibleOperation value)? impossibleOperation,
    TResult Function(_NoDataStored value)? noDataStored,
    required TResult orElse(),
  }) {
    if (impossibleOperation != null) {
      return impossibleOperation(this);
    }
    return orElse();
  }
}

abstract class _ImpossibleOperation implements StorageError {
  const factory _ImpossibleOperation() = _$_ImpossibleOperation;
}

/// @nodoc
abstract class _$NoDataStoredCopyWith<$Res> {
  factory _$NoDataStoredCopyWith(
          _NoDataStored value, $Res Function(_NoDataStored) then) =
      __$NoDataStoredCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoDataStoredCopyWithImpl<$Res> extends _$StorageErrorCopyWithImpl<$Res>
    implements _$NoDataStoredCopyWith<$Res> {
  __$NoDataStoredCopyWithImpl(
      _NoDataStored _value, $Res Function(_NoDataStored) _then)
      : super(_value, (v) => _then(v as _NoDataStored));

  @override
  _NoDataStored get _value => super._value as _NoDataStored;
}

/// @nodoc

class _$_NoDataStored implements _NoDataStored {
  const _$_NoDataStored();

  @override
  String toString() {
    return 'StorageError.noDataStored()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoDataStored);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() impossibleOperation,
    required TResult Function() noDataStored,
  }) {
    return noDataStored();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? impossibleOperation,
    TResult Function()? noDataStored,
  }) {
    return noDataStored?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? impossibleOperation,
    TResult Function()? noDataStored,
    required TResult orElse(),
  }) {
    if (noDataStored != null) {
      return noDataStored();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImpossibleOperation value) impossibleOperation,
    required TResult Function(_NoDataStored value) noDataStored,
  }) {
    return noDataStored(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ImpossibleOperation value)? impossibleOperation,
    TResult Function(_NoDataStored value)? noDataStored,
  }) {
    return noDataStored?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImpossibleOperation value)? impossibleOperation,
    TResult Function(_NoDataStored value)? noDataStored,
    required TResult orElse(),
  }) {
    if (noDataStored != null) {
      return noDataStored(this);
    }
    return orElse();
  }
}

abstract class _NoDataStored implements StorageError {
  const factory _NoDataStored() = _$_NoDataStored;
}
