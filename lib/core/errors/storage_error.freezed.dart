// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
    TResult? Function()? impossibleOperation,
    TResult? Function()? noDataStored,
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
    TResult? Function(_ImpossibleOperation value)? impossibleOperation,
    TResult? Function(_NoDataStored value)? noDataStored,
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
      _$StorageErrorCopyWithImpl<$Res, StorageError>;
}

/// @nodoc
class _$StorageErrorCopyWithImpl<$Res, $Val extends StorageError>
    implements $StorageErrorCopyWith<$Res> {
  _$StorageErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ImpossibleOperationImplCopyWith<$Res> {
  factory _$$ImpossibleOperationImplCopyWith(_$ImpossibleOperationImpl value,
          $Res Function(_$ImpossibleOperationImpl) then) =
      __$$ImpossibleOperationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImpossibleOperationImplCopyWithImpl<$Res>
    extends _$StorageErrorCopyWithImpl<$Res, _$ImpossibleOperationImpl>
    implements _$$ImpossibleOperationImplCopyWith<$Res> {
  __$$ImpossibleOperationImplCopyWithImpl(_$ImpossibleOperationImpl _value,
      $Res Function(_$ImpossibleOperationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ImpossibleOperationImpl implements _ImpossibleOperation {
  const _$ImpossibleOperationImpl();

  @override
  String toString() {
    return 'StorageError.impossibleOperation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImpossibleOperationImpl);
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
    TResult? Function()? impossibleOperation,
    TResult? Function()? noDataStored,
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
    TResult? Function(_ImpossibleOperation value)? impossibleOperation,
    TResult? Function(_NoDataStored value)? noDataStored,
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
  const factory _ImpossibleOperation() = _$ImpossibleOperationImpl;
}

/// @nodoc
abstract class _$$NoDataStoredImplCopyWith<$Res> {
  factory _$$NoDataStoredImplCopyWith(
          _$NoDataStoredImpl value, $Res Function(_$NoDataStoredImpl) then) =
      __$$NoDataStoredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoDataStoredImplCopyWithImpl<$Res>
    extends _$StorageErrorCopyWithImpl<$Res, _$NoDataStoredImpl>
    implements _$$NoDataStoredImplCopyWith<$Res> {
  __$$NoDataStoredImplCopyWithImpl(
      _$NoDataStoredImpl _value, $Res Function(_$NoDataStoredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoDataStoredImpl implements _NoDataStored {
  const _$NoDataStoredImpl();

  @override
  String toString() {
    return 'StorageError.noDataStored()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoDataStoredImpl);
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
    TResult? Function()? impossibleOperation,
    TResult? Function()? noDataStored,
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
    TResult? Function(_ImpossibleOperation value)? impossibleOperation,
    TResult? Function(_NoDataStored value)? noDataStored,
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
  const factory _NoDataStored() = _$NoDataStoredImpl;
}
