// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_info_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransferInfoCWProxy {
  TransferInfo fromAddresses(List<_FromAddressData> fromAddresses);

  TransferInfo toAddresses(List<_ToAddressData> toAddresses);

  TransferInfo fees(TxFeeEstimateResult? fees);

  TransferInfo type(TransferType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferInfo call({
    List<_FromAddressData>? fromAddresses,
    List<_ToAddressData>? toAddresses,
    TxFeeEstimateResult? fees,
    TransferType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransferInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransferInfo.copyWith.fieldName(...)`
class _$TransferInfoCWProxyImpl implements _$TransferInfoCWProxy {
  const _$TransferInfoCWProxyImpl(this._value);

  final TransferInfo _value;

  @override
  TransferInfo fromAddresses(List<_FromAddressData> fromAddresses) =>
      this(fromAddresses: fromAddresses);

  @override
  TransferInfo toAddresses(List<_ToAddressData> toAddresses) =>
      this(toAddresses: toAddresses);

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
    Object? fromAddresses = const $CopyWithPlaceholder(),
    Object? toAddresses = const $CopyWithPlaceholder(),
    Object? fees = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return TransferInfo(
      fromAddresses:
          fromAddresses == const $CopyWithPlaceholder() || fromAddresses == null
              ? _value.fromAddresses
              // ignore: cast_nullable_to_non_nullable
              : fromAddresses as List<_FromAddressData>,
      toAddresses:
          toAddresses == const $CopyWithPlaceholder() || toAddresses == null
              ? _value.toAddresses
              // ignore: cast_nullable_to_non_nullable
              : toAddresses as List<_ToAddressData>,
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
