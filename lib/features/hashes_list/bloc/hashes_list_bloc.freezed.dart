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

  @JsonKey(ignore: true)
  _$HashesListStateCopyWith<_HashesListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$HashesListStateCopyWith<$Res> {
  factory _$HashesListStateCopyWith(
          _HashesListState value, $Res Function(_HashesListState) then) =
      __$HashesListStateCopyWithImpl<$Res, _HashesListState>;
  @useResult
  $Res call({List<HashObject> objects});
}

/// @nodoc
class __$HashesListStateCopyWithImpl<$Res, $Val extends _HashesListState>
    implements _$HashesListStateCopyWith<$Res> {
  __$HashesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objects = null,
  }) {
    return _then(_value.copyWith(
      objects: null == objects
          ? _value.objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<HashObject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HashesListStateImplCopyWith<$Res>
    implements _$HashesListStateCopyWith<$Res> {
  factory _$$_HashesListStateImplCopyWith(_$_HashesListStateImpl value,
          $Res Function(_$_HashesListStateImpl) then) =
      __$$_HashesListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HashObject> objects});
}

/// @nodoc
class __$$_HashesListStateImplCopyWithImpl<$Res>
    extends __$HashesListStateCopyWithImpl<$Res, _$_HashesListStateImpl>
    implements _$$_HashesListStateImplCopyWith<$Res> {
  __$$_HashesListStateImplCopyWithImpl(_$_HashesListStateImpl _value,
      $Res Function(_$_HashesListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objects = null,
  }) {
    return _then(_$_HashesListStateImpl(
      objects: null == objects
          ? _value._objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<HashObject>,
    ));
  }
}

/// @nodoc

class _$_HashesListStateImpl
    with DiagnosticableTreeMixin
    implements __HashesListState {
  const _$_HashesListStateImpl({required final List<HashObject> objects})
      : _objects = objects;

  final List<HashObject> _objects;
  @override
  List<HashObject> get objects {
    if (_objects is EqualUnmodifiableListView) return _objects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objects);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_HashesListState(objects: $objects)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_HashesListState'))
      ..add(DiagnosticsProperty('objects', objects));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HashesListStateImplCopyWith<_$_HashesListStateImpl> get copyWith =>
      __$$_HashesListStateImplCopyWithImpl<_$_HashesListStateImpl>(
          this, _$identity);
}

abstract class __HashesListState implements _HashesListState {
  const factory __HashesListState({required final List<HashObject> objects}) =
      _$_HashesListStateImpl;

  @override
  List<HashObject> get objects;
  @override
  @JsonKey(ignore: true)
  _$$_HashesListStateImplCopyWith<_$_HashesListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
