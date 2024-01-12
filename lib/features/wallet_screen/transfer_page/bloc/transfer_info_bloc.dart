import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/p3d/balance_transaction_type.dart';
import 'package:polkawallet_sdk/p3d/tx_info.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/non_native_tokens_api.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_type_enum.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/usecases/transfer_usecase.dart';
import 'package:threedpass/setup.dart';

part 'meta_tx_infos_fabric.dart';
part 'transfer_info_bloc.g.dart';
part 'transfer_info_bloc_event.dart';
part 'transfer_info_bloc_state.dart';
part 'transfer_info_bloc_fields_events.dart';

class TransferInfoBloc
    extends Bloc<TransferInfoBlocEvent, TransferInfoBlocState> {
  TransferInfoBloc({
    required this.metaDTO,
    required this.appService,
    required this.transferUseCase,
  }) : super(
          TransferInfoBlocState(
            fromAddresses: [initialFrom(appService)],
            toAddresses: [
              ToAddressData(
                toAddressController: TextEditingController(),
              ),
            ],
            fees: null,
            transactionOption: BalanceTransactionTypeValue.defaultType,
            amounts: [
              SendAmountData(
                amountController: TextEditingController(),
              ),
            ],
          ),
        ) {
    final initialAddress = initialFrom(appService).data!.address!;
    final balance = initialBalance(appService, metaDTO);

    balanceCacheNotifier.value = {
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

  static double initialBalance(
    final AppService appService,
    final TransferMetaDTO metaDTO,
  ) {
    switch (metaDTO.type) {
      case MetaInfoType.asset:
        // appService.tokensAreLoading
        final tbd = (metaDTO as AssetTransferMetaDTO).tokenBalanceData;
        final amount = tbd.amount;
        final decimals = tbd.decimals;

        return BalanceUtils.balanceToDouble(amount!, decimals!);

      case MetaInfoType.coin:
        final rawAvaliable =
            appService.chosenAccountBalance.value.availableBalance as String;
        final decimals = appService.networkStateData.safeDecimals;
        final res = BalanceUtils.balanceToDouble(rawAvaliable, decimals);
        return res;
    }
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
  final TransferUseCase transferUseCase;

  final ValueNotifier<Map<String, double>> balanceCacheNotifier =
      ValueNotifier(<String, double>{});

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
    bool extrinsicAccepted = false;

    final globalContext =
        BlocProvider.of<HomeContextCubit>(context).state.context;

    if (formKey.currentState!.validate()) {
      // TODO Make button inactive when form is not valid
      DefaultLoadingDialog.show(globalContext);
      // try {

      final metaTxInfos =
          _MetaTxInfosFabric(metaDTO: metaDTO, state: state).build();

      final passwords = state.fromAddresses
          .map((final e) => e.passwordController.text)
          .toList();

      final TransferUseCaseParams params = TransferUseCaseParams(
        metaInfos: metaTxInfos,
        passwords: passwords,
        symbols: metaDTO.name,
        decimals: metaDTO.decimals,
        transferType: state.transferType,
        onStatusChange: (final p0) {
          if (!extrinsicAccepted) {
            extrinsicAccepted = true;
            DefaultLoadingDialog.hide(globalContext);
            globalContext.router.pop();
          }
        },
      );

      final res = await transferUseCase.call(params);

      if (!extrinsicAccepted) {
        String message = '';
        res.when(
          left: (final f) {
            message = f.cause ?? '';
          },
          right: (final _) {
            getIt<Logger>().d(
              'IMPOSSIBLE SITUATION. extrinsicAccepted = false, res = $res',
            );
          },
        );
        DefaultLoadingDialog.hide(globalContext);
        unawaited(Fluttertoast.showToast(msg: message));
      }
    }
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

  FutureOr<void> updateBalance(final String address) async {
    // final cache = Map<String, double>.from(balanceCacheNotifier.value);
    if (balanceCacheNotifier.value.containsKey(address)) {
      return;
    } else {
      switch (metaDTO.type) {
        case MetaInfoType.asset:
          // appService.tokensAreLoading
          final nnta = NonNativeTokensApi(appService, address);
          final tbd = await nnta.process();
          for (final t in tbd) {
            if (t.id == (metaDTO as AssetTransferMetaDTO).tokenBalanceData.id) {
              try {
                final balance =
                    BalanceUtils.balanceToDouble(t.amount!, t.decimals!);
                balanceCacheNotifier.value[address] = balance;
              } on Object catch (e) {
                print(e);
                unawaited(
                  Fluttertoast.showToast(
                    msg: "Couldn't parse balance of token ${t.id} ${t.name}",
                  ),
                );
              }
            }
          }
        case MetaInfoType.coin:
          final balanceData =
              await appService.plugin.sdk.api.account.queryBalance(address);
          final decimals = appService.networkStateData.safeDecimals;
          final rawAvaliableBalance = balanceData!.availableBalance as String;
          final balance =
              BalanceUtils.balanceToDouble(rawAvaliableBalance, decimals);
          balanceCacheNotifier.value[address] = balance;
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      balanceCacheNotifier.notifyListeners();
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

    await updateBalance(accAddress);
  }
}

/// 1 - SINGLE TRANSFER
/// 2 - FROM ONE TO MANY
/// 3 - FROM MANY TO ONE
// Future<void> caseSplit({
//   required final List<dynamic> txInfos,
//   required final List<dynamic> params,
//   required final List<dynamic> passwords,
//   required final dynamic Function() onFirst,
//   required final dynamic Function() onSecond,
//   required final dynamic Function() onThird,
//   required final dynamic Function() onError,
// }) async {
//   debugPrint(
//     'caseSplit txInfosLen=${txInfos.length} paramsLen=${params.length} passwordsLen=${passwords.length}',
//   );
//   if (txInfos.length == 1 && params.length == 1) {
//     // SINGLE TRANSFER
//     onFirst();
//   } else if (txInfos.length == 1 && params.length > 1) {
//     // FROM ONE TO MANY
//     onSecond();
//   } else if (txInfos.length > 1 &&
//       params.length == 1 &&
//       txInfos.length == passwords.length) {
//     // FROM MANY TO ONE
//     onThird();
//   } else {
//     onError();
//   }
// }
