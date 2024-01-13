// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poscan_objects_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PoscanObjectsStateCWProxy {
  PoscanObjectsState objects(List<UploadedObject> objects);

  PoscanObjectsState status(PoscanObjectStateStatus status);

  PoscanObjectsState message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PoscanObjectsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PoscanObjectsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PoscanObjectsState call({
    List<UploadedObject>? objects,
    PoscanObjectStateStatus? status,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPoscanObjectsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPoscanObjectsState.copyWith.fieldName(...)`
class _$PoscanObjectsStateCWProxyImpl implements _$PoscanObjectsStateCWProxy {
  const _$PoscanObjectsStateCWProxyImpl(this._value);

  final PoscanObjectsState _value;

  @override
  PoscanObjectsState objects(List<UploadedObject> objects) =>
      this(objects: objects);

  @override
  PoscanObjectsState status(PoscanObjectStateStatus status) =>
      this(status: status);

  @override
  PoscanObjectsState message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PoscanObjectsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PoscanObjectsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PoscanObjectsState call({
    Object? objects = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return PoscanObjectsState(
      objects: objects == const $CopyWithPlaceholder() || objects == null
          ? _value.objects
          // ignore: cast_nullable_to_non_nullable
          : objects as List<UploadedObject>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as PoscanObjectStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $PoscanObjectsStateCopyWith on PoscanObjectsState {
  /// Returns a callable class that can be used as follows: `instanceOfPoscanObjectsState.copyWith(...)` or like so:`instanceOfPoscanObjectsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PoscanObjectsStateCWProxy get copyWith =>
      _$PoscanObjectsStateCWProxyImpl(this);
}
