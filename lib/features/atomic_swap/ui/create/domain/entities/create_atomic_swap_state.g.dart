// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_atomic_swap_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateAtomicSwapStateCWProxy {
  CreateAtomicSwapState target(String? target);

  CreateAtomicSwapState action(BigInt? action);

  CreateAtomicSwapState deadline(DateTime? deadline);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateAtomicSwapState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateAtomicSwapState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateAtomicSwapState call({
    String? target,
    BigInt? action,
    DateTime? deadline,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateAtomicSwapState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateAtomicSwapState.copyWith.fieldName(...)`
class _$CreateAtomicSwapStateCWProxyImpl
    implements _$CreateAtomicSwapStateCWProxy {
  const _$CreateAtomicSwapStateCWProxyImpl(this._value);

  final CreateAtomicSwapState _value;

  @override
  CreateAtomicSwapState target(String? target) => this(target: target);

  @override
  CreateAtomicSwapState action(BigInt? action) => this(action: action);

  @override
  CreateAtomicSwapState deadline(DateTime? deadline) =>
      this(deadline: deadline);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateAtomicSwapState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateAtomicSwapState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateAtomicSwapState call({
    Object? target = const $CopyWithPlaceholder(),
    Object? action = const $CopyWithPlaceholder(),
    Object? deadline = const $CopyWithPlaceholder(),
  }) {
    return CreateAtomicSwapState(
      target: target == const $CopyWithPlaceholder()
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as String?,
      action: action == const $CopyWithPlaceholder()
          ? _value.action
          // ignore: cast_nullable_to_non_nullable
          : action as BigInt?,
      deadline: deadline == const $CopyWithPlaceholder()
          ? _value.deadline
          // ignore: cast_nullable_to_non_nullable
          : deadline as DateTime?,
    );
  }
}

extension $CreateAtomicSwapStateCopyWith on CreateAtomicSwapState {
  /// Returns a callable class that can be used as follows: `instanceOfCreateAtomicSwapState.copyWith(...)` or like so:`instanceOfCreateAtomicSwapState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateAtomicSwapStateCWProxy get copyWith =>
      _$CreateAtomicSwapStateCWProxyImpl(this);
}
