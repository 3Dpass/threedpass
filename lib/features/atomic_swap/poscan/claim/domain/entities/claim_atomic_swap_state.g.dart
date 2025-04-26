// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_atomic_swap_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClaimAtomicSwapStateCWProxy {
  ClaimAtomicSwapState target(KeyPairData? target);

  ClaimAtomicSwapState hashedProof(AsyncValue<String> hashedProof);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClaimAtomicSwapState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClaimAtomicSwapState(...).copyWith(id: 12, name: "My name")
  /// ````
  ClaimAtomicSwapState call({
    KeyPairData? target,
    AsyncValue<String>? hashedProof,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClaimAtomicSwapState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClaimAtomicSwapState.copyWith.fieldName(...)`
class _$ClaimAtomicSwapStateCWProxyImpl
    implements _$ClaimAtomicSwapStateCWProxy {
  const _$ClaimAtomicSwapStateCWProxyImpl(this._value);

  final ClaimAtomicSwapState _value;

  @override
  ClaimAtomicSwapState target(KeyPairData? target) => this(target: target);

  @override
  ClaimAtomicSwapState hashedProof(AsyncValue<String> hashedProof) =>
      this(hashedProof: hashedProof);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClaimAtomicSwapState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClaimAtomicSwapState(...).copyWith(id: 12, name: "My name")
  /// ````
  ClaimAtomicSwapState call({
    Object? target = const $CopyWithPlaceholder(),
    Object? hashedProof = const $CopyWithPlaceholder(),
  }) {
    return ClaimAtomicSwapState(
      target: target == const $CopyWithPlaceholder()
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as KeyPairData?,
      hashedProof:
          hashedProof == const $CopyWithPlaceholder() || hashedProof == null
              ? _value.hashedProof
              // ignore: cast_nullable_to_non_nullable
              : hashedProof as AsyncValue<String>,
    );
  }
}

extension $ClaimAtomicSwapStateCopyWith on ClaimAtomicSwapState {
  /// Returns a callable class that can be used as follows: `instanceOfClaimAtomicSwapState.copyWith(...)` or like so:`instanceOfClaimAtomicSwapState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClaimAtomicSwapStateCWProxy get copyWith =>
      _$ClaimAtomicSwapStateCWProxyImpl(this);
}
