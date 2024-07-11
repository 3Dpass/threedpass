// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poscan_objects_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PoscanObjectsStateCWProxy {
  PoscanObjectsState isLoading(bool isLoading);

  PoscanObjectsState message(String? message);

  PoscanObjectsState storageCount(int? storageCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PoscanObjectsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PoscanObjectsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PoscanObjectsState call({
    bool? isLoading,
    String? message,
    int? storageCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPoscanObjectsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPoscanObjectsState.copyWith.fieldName(...)`
class _$PoscanObjectsStateCWProxyImpl implements _$PoscanObjectsStateCWProxy {
  const _$PoscanObjectsStateCWProxyImpl(this._value);

  final PoscanObjectsState _value;

  @override
  PoscanObjectsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  PoscanObjectsState message(String? message) => this(message: message);

  @override
  PoscanObjectsState storageCount(int? storageCount) =>
      this(storageCount: storageCount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PoscanObjectsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PoscanObjectsState(...).copyWith(id: 12, name: "My name")
  /// ````
  PoscanObjectsState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? storageCount = const $CopyWithPlaceholder(),
  }) {
    return PoscanObjectsState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      storageCount: storageCount == const $CopyWithPlaceholder()
          ? _value.storageCount
          // ignore: cast_nullable_to_non_nullable
          : storageCount as int?,
    );
  }
}

extension $PoscanObjectsStateCopyWith on PoscanObjectsState {
  /// Returns a callable class that can be used as follows: `instanceOfPoscanObjectsState.copyWith(...)` or like so:`instanceOfPoscanObjectsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PoscanObjectsStateCWProxy get copyWith =>
      _$PoscanObjectsStateCWProxyImpl(this);
}
