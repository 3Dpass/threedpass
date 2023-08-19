// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_info_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransferInfoCWProxy {
  TransferInfo balance(double balance);

  TransferInfo fees(TxFeeEstimateResult? fees);

  TransferInfo type(TransferType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferInfo call({
    double? balance,
    TxFeeEstimateResult? fees,
    TransferType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransferInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransferInfo.copyWith.fieldName(...)`
class _$TransferInfoCWProxyImpl implements _$TransferInfoCWProxy {
  const _$TransferInfoCWProxyImpl(this._value);

  final TransferInfo _value;

  @override
  TransferInfo balance(double balance) => this(balance: balance);

  @override
  TransferInfo fees(TxFeeEstimateResult? fees) => this(fees: fees);

  @override
  TransferInfo type(TransferType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferInfo call({
    Object? balance = const $CopyWithPlaceholder(),
    Object? fees = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return TransferInfo(
      balance: balance == const $CopyWithPlaceholder() || balance == null
          ? _value.balance
          // ignore: cast_nullable_to_non_nullable
          : balance as double,
      fees: fees == const $CopyWithPlaceholder()
          ? _value.fees
          // ignore: cast_nullable_to_non_nullable
          : fees as TxFeeEstimateResult?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TransferType,
    );
  }
}

extension $TransferInfoCopyWith on TransferInfo {
  /// Returns a callable class that can be used as follows: `instanceOfTransferInfo.copyWith(...)` or like so:`instanceOfTransferInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TransferInfoCWProxy get copyWith => _$TransferInfoCWProxyImpl(this);
}
