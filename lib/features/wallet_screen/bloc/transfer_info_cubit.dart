import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';

part 'transfer_info_cubit.g.dart';

class TransferInfoCubit extends Cubit<TransferInfo> {
  TransferInfoCubit({
    required this.metaDTO,
    required this.appService,
  }) : super(
          TransferInfo(
            fromAddresses: [initialFrom(appService)],
            toAddresses: [
              ToAddressData(
                toAddressController: TextEditingController(),
              ),
            ],
            fees: null,
            type: TransferTypeValue.defaultType,
            amounts: [
              SendAmountData(
                amountController: TextEditingController(),
              ),
            ],
          ),
        );

  static FromAddressData initialFrom(final AppService appService) {
    final account = appService.keyring.current;
    // final balance = double.tryParse(
    //   appService.chosenAccountBalance.value.availableBalance.toString(),
    // );
    return FromAddressData(
      data: account,
      // addressController: TextEditingController(),
      passwordController: TextEditingController(),
    );
  }

  final TransferMetaDTO metaDTO;
  final AppService appService;

  Future<void> init() async {
    // final txInfo = metaDTO.getTxInfo(state.type);
    // final params = metaDTO.getParams(
    //   '10',
    //   appService.userSenderData.address.toString(),
    // );

    // // This line throws error:
    // // {"path":"log","data":{"call":"uid=8;keyring.txFeeEstimate","error":"t.rpc.payment.queryInfo is not a function"}}
    // // Firstly there were wring types in dart code.
    // // I fixed them here: https://github.com/L3odr0id/polkawallet_sdk/commit/ccafe364cb231c7d1888648257f5f3002ebb8b2b
    // // But it turned out that there is a problem with the JS code deep inside.

    // final fee = await appService.plugin.sdk.api.tx.estimateFees(txInfo, params);
    // print(appService.networkStateData.tokenDecimals);
    // print(fee.partialFee);
    // print(fee.weight);
    // // TODO Add fees
    // final b = 1 + 1;

    // emit(state.copyWith(fees: fee));

    // print(
    //   BalanceUtils.balance(state.fees?.partialFee.toString(), 12),
    // );
    // print(
    //   BalanceUtils.balanceInt(state.fees?.partialFee.toString()),
    // );
    // print(
    //   BalanceUtils.balanceToDouble(state.fees!.partialFee.toString(), 12),
    // );
    // print(
    //   BalanceUtils.balance(state.fees?.weight.toString(), 12),
    // );
  }

  Future<void> sendTransfer({
    required final String amount,
    required final String toAddress,
    required final BuildContext context,
    required final String password,
    required final GlobalKey<FormState> formKey,
  }) async {
    // final txInfo = metaDTO.getTxInfo(state.type);
    // final params = metaDTO.getParams(
    //   amount,
    //   toAddress,
    // );

    // final notificationsCubit = BlocProvider.of<NotificationsCubit>(context);
    // final appServiceCubit = BlocProvider.of<AppServiceLoaderCubit>(context);

    // // print(metaDTO.getName());

    // await Transfer(
    //   txInfo: txInfo,
    //   params: params,
    //   appService: appService,
    //   context: context,
    //   toAddress: toAddress,
    //   password: password,
    //   formKey: formKey,
    //   notificationsCubit: notificationsCubit,
    //   addHandler: appServiceCubit.addHandler,
    //   symbols: metaDTO.getName(),
    //   decimals: metaDTO.decimals,
    //   amountNotification: amount,
    // ).sendFunds();
  }

  void updateTransferType(final TransactionOption type) {
    emit(state.copyWith(type: type));
  }

  void addFromAddress() {
    final newFromAddresses = List<FromAddressData>.from(state.fromAddresses);
    newFromAddresses.add(
      FromAddressData(
        data: null,
        passwordController: TextEditingController(),
      ),
    );

    final newAmountsList = List<SendAmountData>.from(state.amounts);
    newAmountsList.add(
      SendAmountData(
        amountController: TextEditingController(),
      ),
    );

    emit(
      state.copyWith(
        fromAddresses: newFromAddresses,
        amounts: newAmountsList,
      ),
    );
  }

  void addToAddress() {
    final newToAddresses = List<ToAddressData>.from(state.toAddresses);
    newToAddresses.add(
      ToAddressData(
        toAddressController: TextEditingController(),
      ),
    );

    final newAmountsList = List<SendAmountData>.from(state.amounts);
    newAmountsList.add(
      SendAmountData(
        amountController: TextEditingController(),
      ),
    );

    emit(
      state.copyWith(
        toAddresses: newToAddresses,
        amounts: newAmountsList,
      ),
    );
  }

  void changeChosenAccount(
    final FromAddressData dataToChange,
    final KeyPairData? acc,
  ) {
    if (dataToChange.data == acc) {
      return;
    }

    final newFromAddresses = List<FromAddressData>.from(state.fromAddresses);
    final newAddressData = dataToChange.copyWith(data: acc);

    newFromAddresses.replace(dataToChange, newAddressData);

    emit(state.copyWith(fromAddresses: newFromAddresses));
  }

  void removeFromAddress(final FromAddressData fromAddressData) {
    final newFromAddresses = List<FromAddressData>.from(state.fromAddresses);
    newFromAddresses.remove(fromAddressData);

    emit(state.copyWith(fromAddresses: newFromAddresses));
  }

  void removeToAddress(final ToAddressData toAddressData) {
    final newToAddresses = List<ToAddressData>.from(state.toAddresses);
    newToAddresses.remove(toAddressData);

    emit(state.copyWith(toAddresses: newToAddresses));
  }

  void copyPasswordIn(final FromAddressData data) {
    final newFromAddresses = List<FromAddressData>.from(state.fromAddresses);
    final indexOfCurrent = newFromAddresses.indexOf(data);
    if (indexOfCurrent == 0 || indexOfCurrent == -1) {
      return;
    }

    final indexOfFocus = indexOfCurrent - 1;
    final focusData = newFromAddresses[indexOfFocus];

    final newData = data.copyWith();
    newData.passwordController.text = focusData.passwordController.text;

    newFromAddresses.replace(data, newData);

    emit(state.copyWith(fromAddresses: newFromAddresses));
  }
}

enum TransferScreenType { many_to_one, one_to_many }

@CopyWith()
class TransferInfo {
  // Max avaliable balance in wallet in human-readable double format
  // final double balance;
  final TxFeeEstimateResult? fees;
  final TransactionOption type;
  final List<FromAddressData> fromAddresses;
  final List<ToAddressData> toAddresses;
  final List<SendAmountData> amounts;

  const TransferInfo({
    required this.fromAddresses,
    required this.toAddresses,
    required this.fees,
    required this.type,
    required this.amounts,
  });

  TransferScreenType get screenType =>
      fromAddresses.length >= toAddresses.length
          ? TransferScreenType.many_to_one
          : TransferScreenType.one_to_many;
}

// @CopyWith()
// class AddressData {
//   const AddressData({
//     required this.data,
//     required this.addressController,
//     required this.passwordController,
//   });

//   final KeyPairData? data;
//   final TextEditingController addressController;
//   final TextEditingController passwordController;
// }

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
  });

  final TextEditingController amountController;

  // double? get amount => double.tryParse(amountController.text);
}
