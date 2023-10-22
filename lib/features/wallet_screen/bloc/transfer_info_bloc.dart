import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';

part 'transfer_info_bloc.g.dart';
part 'transfer_info_bloc_event.dart';
part 'transfer_info_bloc_state.dart';
part 'transfer_info_bloc_fields_events.dart';

class TransferInfoBloc
    extends Bloc<TransferInfoBlocEvent, TransferInfoBlocState> {
  TransferInfoBloc({
    required this.metaDTO,
    required this.appService,
  }) : super(
          TransferInfoBlocState(
            fromAddresses: [initialFrom(appService)],
            toAddresses: [
              ToAddressData(
                toAddressController: TextEditingController(),
              ),
            ],
            fees: null,
            transactionOption: TransferTypeValue.defaultType,
            amounts: [
              SendAmountData(
                amountController: TextEditingController(),
                balance: initialBalance(appService),
              ),
            ],
          ),
        ) {
    final initialAddress = initialFrom(appService).data!.address!;
    final balance = initialBalance(appService);

    balanceCache = {
      initialAddress: balance,
    };

    on<UpdateTransferTypeEvent>(_updateTransferType);
    on<AddFromAddressEvent>(_addFromAddress);
    on<AddToAddressEvent>(_addToAddress);
    on<ChangeChosenAccountEvent>(_changeChosenAccount);
    on<SetBalanceAmountEvent>(_setBalanceAmount);
    on<RemoveFromAddressEvent>(_removeFromAddress);
    on<RemoveToAddressEvent>(_removeToAddress);
    on<CopyPasswordEvent>(_copyPassword);
  }
  static double initialBalance(final AppService appService) {
    final rawAvaliable =
        appService.chosenAccountBalance.value.availableBalance as String;
    final decimals = appService.networkStateData.safeDecimals;
    final res = BalanceUtils.balanceToDouble(rawAvaliable, decimals);
    return res;
  }

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

  late final Map<String, double> balanceCache;

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
    required final BuildContext context,
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

  void _updateTransferType(
    final UpdateTransferTypeEvent event,
    final Emitter<TransferInfoBlocState> emit,
  ) {
    // emit(state.copyWith(type: type));
    final newState = state.copyWith(transactionOption: event.value);
    emit(newState);
  }

  void _changeChosenAccount(
    final ChangeChosenAccountEvent event,
    final Emitter<TransferInfoBlocState> emit,
  ) {
    final dataToChange = event.dataToChange;
    final acc = event.acc;

    if (dataToChange.data == acc) {
      return;
    }

    final newFromAddresses = List<FromAddressData>.from(state.fromAddresses);
    final newAddressData = dataToChange.copyWith(data: acc);

    newFromAddresses.replace(dataToChange, newAddressData);

    emit(state.copyWith(fromAddresses: newFromAddresses));

    add(SetBalanceAmountEvent(newAddressData));
  }

  void _copyPassword(
    final CopyPasswordEvent event,
    final Emitter<TransferInfoBlocState> emit,
  ) {
    final data = event.fromAddressData;
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

  FutureOr<double> getBalance(final String address) async {
    if (balanceCache.containsKey(address)) {
      return Future.value(balanceCache[address]!);
    } else {
      final balanceData =
          await appService.plugin.sdk.api.account.queryBalance(address);
      final decimals = appService.networkStateData.safeDecimals;
      final rawAvaliableBalance = balanceData!.availableBalance as String;
      final balance =
          BalanceUtils.balanceToDouble(rawAvaliableBalance, decimals);
      balanceCache[address] = balance;
      return balance;
    }
  }

  Future<void> _setBalanceAmount(
    final SetBalanceAmountEvent event,
    final Emitter<TransferInfoBlocState> emit,
  ) async {
    final accAddress = event.fromAddressData.data?.address;

    if (accAddress == null) {
      return;
    }

    final balance = await getBalance(accAddress);

    // Some racing is possible
    final newAmountsList = List<SendAmountData>.from(state.amounts);
    final newFromAddresses = List<FromAddressData>.from(state.fromAddresses);
    final indexOfCurrent = newFromAddresses.indexOf(event.fromAddressData);

    final oldAmount = newAmountsList[indexOfCurrent];
    final newAmount = oldAmount.copyWith(balance: balance);
    newAmountsList.replace(oldAmount, newAmount);

    emit(state.copyWith(amounts: newAmountsList));
  }
}
