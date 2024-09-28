// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hashes_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HashesListState {
  List<HashObject> get objects => throw _privateConstructorUsedError;
  bool get loaded => throw _privateConstructorUsedError;
  bool get isDeletingInProcess => throw _privateConstructorUsedError;
  bool get requiresScroll => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HashesListStateCopyWith<HashesListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HashesListStateCopyWith<$Res> {
  factory $HashesListStateCopyWith(
          HashesListState value, $Res Function(HashesListState) then) =
      _$HashesListStateCopyWithImpl<$Res, HashesListState>;
  @useResult
  $Res call(
      {List<HashObject> objects,
      bool loaded,
      bool isDeletingInProcess,
      bool requiresScroll});
}

/// @nodoc
class _$HashesListStateCopyWithImpl<$Res, $Val extends HashesListState>
    implements $HashesListStateCopyWith<$Res> {
  _$HashesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objects = null,
    Object? loaded = null,
    Object? isDeletingInProcess = null,
    Object? requiresScroll = null,
  }) {
    return _then(_value.copyWith(
      objects: null == objects
          ? _value.objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<HashObject>,
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletingInProcess: null == isDeletingInProcess
          ? _value.isDeletingInProcess
          : isDeletingInProcess // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresScroll: null == requiresScroll
          ? _value.requiresScroll
          : requiresScroll // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HashesListStateImplCopyWith<$Res>
    implements $HashesListStateCopyWith<$Res> {
  factory _$$HashesListStateImplCopyWith(_$HashesListStateImpl value,
          $Res Function(_$HashesListStateImpl) then) =
      __$$HashesListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HashObject> objects,
      bool loaded,
      bool isDeletingInProcess,
      bool requiresScroll});
}

/// @nodoc
class __$$HashesListStateImplCopyWithImpl<$Res>
    extends _$HashesListStateCopyWithImpl<$Res, _$HashesListStateImpl>
    implements _$$HashesListStateImplCopyWith<$Res> {
  __$$HashesListStateImplCopyWithImpl(
      _$HashesListStateImpl _value, $Res Function(_$HashesListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objects = null,
    Object? loaded = null,
    Object? isDeletingInProcess = null,
    Object? requiresScroll = null,
  }) {
    return _then(_$HashesListStateImpl(
      objects: null == objects
          ? _value._objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<HashObject>,
      loaded: null == loaded
          ? _value.loaded
          : loaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletingInProcess: null == isDeletingInProcess
          ? _value.isDeletingInProcess
          : isDeletingInProcess // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresScroll: null == requiresScroll
          ? _value.requiresScroll
          : requiresScroll // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HashesListStateImpl implements _HashesListState {
  const _$HashesListStateImpl(
      {required final List<HashObject> objects,
      required this.loaded,
      required this.isDeletingInProcess,
      required this.requiresScroll})
      : _objects = objects;

  final List<HashObject> _objects;
  @override
  List<HashObject> get objects {
    if (_objects is EqualUnmodifiableListView) return _objects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objects);
  }

  @override
  final bool loaded;
  @override
  final bool isDeletingInProcess;
  @override
  final bool requiresScroll;

  @override
  String toString() {
    return 'HashesListState(objects: $objects, loaded: $loaded, isDeletingInProcess: $isDeletingInProcess, requiresScroll: $requiresScroll)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HashesListStateImplCopyWith<_$HashesListStateImpl> get copyWith =>
      __$$HashesListStateImplCopyWithImpl<_$HashesListStateImpl>(
          this, _$identity);
}

abstract class _HashesListState implements HashesListState {
  const factory _HashesListState(
      {required final List<HashObject> objects,
      required final bool loaded,
      required final bool isDeletingInProcess,
      required final bool requiresScroll}) = _$HashesListStateImpl;

  @override
  List<HashObject> get objects;
  @override
  bool get loaded;
  @override
  bool get isDeletingInProcess;
  @override
  bool get requiresScroll;
  @override
  @JsonKey(ignore: true)
  _$$HashesListStateImplCopyWith<_$HashesListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
