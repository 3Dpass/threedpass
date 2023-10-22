part of 'transfer_info_bloc.dart';

@CopyWith()
class TransferInfoBlocState {
  // Max avaliable balance in wallet in human-readable double format
  // final double balance;
  final TxFeeEstimateResult? fees;
  final TransactionOption transactionOption;
  final List<FromAddressData> fromAddresses;
  final List<ToAddressData> toAddresses;
  final List<SendAmountData> amounts;

  const TransferInfoBlocState({
    required this.fromAddresses,
    required this.toAddresses,
    required this.fees,
    required this.transactionOption,
    required this.amounts,
  });

  TransferScreenType get screenType =>
      fromAddresses.length >= toAddresses.length
          ? TransferScreenType.many_to_one
          : TransferScreenType.one_to_many;
}

enum TransferScreenType { many_to_one, one_to_many }

@CopyWith()
class FromAddressData {
  const FromAddressData({
    required this.data,
    required this.passwordController,
  });

  final KeyPairData? data;
  final TextEditingController passwordController;
}

@CopyWith()
class ToAddressData {
  const ToAddressData({
    required this.toAddressController,
  });

  final TextEditingController toAddressController;
}

@CopyWith()
class SendAmountData {
  const SendAmountData({
    required this.amountController,
    required this.balance,
  });

  final TextEditingController amountController;
  final double? balance;
}
