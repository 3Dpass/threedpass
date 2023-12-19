// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_info_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransferInfoBlocStateCWProxy {
  TransferInfoBlocState fromAddresses(List<FromAddressData> fromAddresses);

  TransferInfoBlocState toAddresses(List<ToAddressData> toAddresses);

  TransferInfoBlocState fees(TxFeeEstimateResult? fees);

  TransferInfoBlocState transactionOption(
      BalanceTransactionType transactionOption);

  TransferInfoBlocState amounts(List<SendAmountData> amounts);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferInfoBlocState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferInfoBlocState(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferInfoBlocState call({
    List<FromAddressData>? fromAddresses,
    List<ToAddressData>? toAddresses,
    TxFeeEstimateResult? fees,
    BalanceTransactionType? transactionOption,
    List<SendAmountData>? amounts,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransferInfoBlocState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransferInfoBlocState.copyWith.fieldName(...)`
class _$TransferInfoBlocStateCWProxyImpl
    implements _$TransferInfoBlocStateCWProxy {
  const _$TransferInfoBlocStateCWProxyImpl(this._value);

  final TransferInfoBlocState _value;

  @override
  TransferInfoBlocState fromAddresses(List<FromAddressData> fromAddresses) =>
      this(fromAddresses: fromAddresses);

  @override
  TransferInfoBlocState toAddresses(List<ToAddressData> toAddresses) =>
      this(toAddresses: toAddresses);

  @override
  TransferInfoBlocState fees(TxFeeEstimateResult? fees) => this(fees: fees);

  @override
  TransferInfoBlocState transactionOption(
          BalanceTransactionType transactionOption) =>
      this(transactionOption: transactionOption);

  @override
  TransferInfoBlocState amounts(List<SendAmountData> amounts) =>
      this(amounts: amounts);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferInfoBlocState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferInfoBlocState(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferInfoBlocState call({
    Object? fromAddresses = const $CopyWithPlaceholder(),
    Object? toAddresses = const $CopyWithPlaceholder(),
    Object? fees = const $CopyWithPlaceholder(),
    Object? transactionOption = const $CopyWithPlaceholder(),
    Object? amounts = const $CopyWithPlaceholder(),
  }) {
    return TransferInfoBlocState(
      fromAddresses:
          fromAddresses == const $CopyWithPlaceholder() || fromAddresses == null
              ? _value.fromAddresses
              // ignore: cast_nullable_to_non_nullable
              : fromAddresses as List<FromAddressData>,
      toAddresses:
          toAddresses == const $CopyWithPlaceholder() || toAddresses == null
              ? _value.toAddresses
              // ignore: cast_nullable_to_non_nullable
              : toAddresses as List<ToAddressData>,
      fees: fees == const $CopyWithPlaceholder()
          ? _value.fees
          // ignore: cast_nullable_to_non_nullable
          : fees as TxFeeEstimateResult?,
      transactionOption: transactionOption == const $CopyWithPlaceholder() ||
              transactionOption == null
          ? _value.transactionOption
          // ignore: cast_nullable_to_non_nullable
          : transactionOption as BalanceTransactionType,
      amounts: amounts == const $CopyWithPlaceholder() || amounts == null
          ? _value.amounts
          // ignore: cast_nullable_to_non_nullable
          : amounts as List<SendAmountData>,
    );
  }
}

extension $TransferInfoBlocStateCopyWith on TransferInfoBlocState {
  /// Returns a callable class that can be used as follows: `instanceOfTransferInfoBlocState.copyWith(...)` or like so:`instanceOfTransferInfoBlocState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TransferInfoBlocStateCWProxy get copyWith =>
      _$TransferInfoBlocStateCWProxyImpl(this);
}

abstract class _$FromAddressDataCWProxy {
  FromAddressData data(KeyPairData? data);

  FromAddressData passwordController(TextEditingController passwordController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FromAddressData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FromAddressData(...).copyWith(id: 12, name: "My name")
  /// ````
  FromAddressData call({
    KeyPairData? data,
    TextEditingController? passwordController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFromAddressData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFromAddressData.copyWith.fieldName(...)`
class _$FromAddressDataCWProxyImpl implements _$FromAddressDataCWProxy {
  const _$FromAddressDataCWProxyImpl(this._value);

  final FromAddressData _value;

  @override
  FromAddressData data(KeyPairData? data) => this(data: data);

  @override
  FromAddressData passwordController(
          TextEditingController passwordController) =>
      this(passwordController: passwordController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FromAddressData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FromAddressData(...).copyWith(id: 12, name: "My name")
  /// ````
  FromAddressData call({
    Object? data = const $CopyWithPlaceholder(),
    Object? passwordController = const $CopyWithPlaceholder(),
  }) {
    return FromAddressData(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as KeyPairData?,
      passwordController: passwordController == const $CopyWithPlaceholder() ||
              passwordController == null
          ? _value.passwordController
          // ignore: cast_nullable_to_non_nullable
          : passwordController as TextEditingController,
    );
  }
}

extension $FromAddressDataCopyWith on FromAddressData {
  /// Returns a callable class that can be used as follows: `instanceOfFromAddressData.copyWith(...)` or like so:`instanceOfFromAddressData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FromAddressDataCWProxy get copyWith => _$FromAddressDataCWProxyImpl(this);
}

abstract class _$ToAddressDataCWProxy {
  ToAddressData toAddressController(TextEditingController toAddressController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ToAddressData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ToAddressData(...).copyWith(id: 12, name: "My name")
  /// ````
  ToAddressData call({
    TextEditingController? toAddressController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfToAddressData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfToAddressData.copyWith.fieldName(...)`
class _$ToAddressDataCWProxyImpl implements _$ToAddressDataCWProxy {
  const _$ToAddressDataCWProxyImpl(this._value);

  final ToAddressData _value;

  @override
  ToAddressData toAddressController(
          TextEditingController toAddressController) =>
      this(toAddressController: toAddressController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ToAddressData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ToAddressData(...).copyWith(id: 12, name: "My name")
  /// ````
  ToAddressData call({
    Object? toAddressController = const $CopyWithPlaceholder(),
  }) {
    return ToAddressData(
      toAddressController:
          toAddressController == const $CopyWithPlaceholder() ||
                  toAddressController == null
              ? _value.toAddressController
              // ignore: cast_nullable_to_non_nullable
              : toAddressController as TextEditingController,
    );
  }
}

extension $ToAddressDataCopyWith on ToAddressData {
  /// Returns a callable class that can be used as follows: `instanceOfToAddressData.copyWith(...)` or like so:`instanceOfToAddressData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ToAddressDataCWProxy get copyWith => _$ToAddressDataCWProxyImpl(this);
}

abstract class _$SendAmountDataCWProxy {
  SendAmountData amountController(TextEditingController amountController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SendAmountData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SendAmountData(...).copyWith(id: 12, name: "My name")
  /// ````
  SendAmountData call({
    TextEditingController? amountController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSendAmountData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSendAmountData.copyWith.fieldName(...)`
class _$SendAmountDataCWProxyImpl implements _$SendAmountDataCWProxy {
  const _$SendAmountDataCWProxyImpl(this._value);

  final SendAmountData _value;

  @override
  SendAmountData amountController(TextEditingController amountController) =>
      this(amountController: amountController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SendAmountData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SendAmountData(...).copyWith(id: 12, name: "My name")
  /// ````
  SendAmountData call({
    Object? amountController = const $CopyWithPlaceholder(),
  }) {
    return SendAmountData(
      amountController: amountController == const $CopyWithPlaceholder() ||
              amountController == null
          ? _value.amountController
          // ignore: cast_nullable_to_non_nullable
          : amountController as TextEditingController,
    );
  }
}

extension $SendAmountDataCopyWith on SendAmountData {
  /// Returns a callable class that can be used as follows: `instanceOfSendAmountData.copyWith(...)` or like so:`instanceOfSendAmountData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SendAmountDataCWProxy get copyWith => _$SendAmountDataCWProxyImpl(this);
}
