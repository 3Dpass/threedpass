// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_atomic_swap_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CancelAtomicSwapStateCWProxy {
  CancelAtomicSwapState target(KeyPair? target);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CancelAtomicSwapState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CancelAtomicSwapState(...).copyWith(id: 12, name: "My name")
  /// ````
  CancelAtomicSwapState call({
    KeyPair? target,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCancelAtomicSwapState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCancelAtomicSwapState.copyWith.fieldName(...)`
class _$CancelAtomicSwapStateCWProxyImpl
    implements _$CancelAtomicSwapStateCWProxy {
  const _$CancelAtomicSwapStateCWProxyImpl(this._value);

  final CancelAtomicSwapState _value;

  @override
  CancelAtomicSwapState target(KeyPair? target) => this(target: target);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CancelAtomicSwapState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CancelAtomicSwapState(...).copyWith(id: 12, name: "My name")
  /// ````
  CancelAtomicSwapState call({
    Object? target = const $CopyWithPlaceholder(),
  }) {
    return CancelAtomicSwapState(
      target: target == const $CopyWithPlaceholder()
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as KeyPair?,
    );
  }
}

extension $CancelAtomicSwapStateCopyWith on CancelAtomicSwapState {
  /// Returns a callable class that can be used as follows: `instanceOfCancelAtomicSwapState.copyWith(...)` or like so:`instanceOfCancelAtomicSwapState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CancelAtomicSwapStateCWProxy get copyWith =>
      _$CancelAtomicSwapStateCWProxyImpl(this);
}
