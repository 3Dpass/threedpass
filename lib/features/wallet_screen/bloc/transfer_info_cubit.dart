import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';

class TransferInfoCubit extends Cubit<TransferInfo> {
  TransferInfoCubit({
    required final String balance,
    required this.metaDTO,
  }) : super(TransferInfo(balance: balance, fees: null));

  final TransferMetaDTO metaDTO;

  Future<void> init(final AppService appService) async {
    final params = [
      appService.keyring.allWithContacts.first.address,
      '10000000000',
    ];

    final txInfo = TxInfoData(
      'balances',
      'transferKeepAlive',
      appService.userSenderData,
    );

    // This line throws error:
    // {"path":"log","data":{"call":"uid=8;keyring.txFeeEstimate","error":"t.rpc.payment.queryInfo is not a function"}}
    // Firstly there were wring types in dart code.
    // I fixed them here: https://github.com/L3odr0id/polkawallet_sdk/commit/ccafe364cb231c7d1888648257f5f3002ebb8b2b
    // But it turned out that there is a problem with the JS code deep inside.
    final fee = await appService.plugin.sdk.api.tx.estimateFees(txInfo, params);
    print(appService.networkStateData.tokenDecimals);
    print(fee.partialFee);
    print(fee.weight);
    // TODO Add fees
    final b = 1 + 1;

    emit(TransferInfo(balance: state.balance, fees: fee));
  }

  Future<void> sendTransfer({
    required final AppService appService,
    required final String amount,
    required final String toAddress,
    required final BuildContext context,
    required final String password,
    required final GlobalKey<FormState> formKey,
  }) async {
    final txInfo = metaDTO.getTxInfo(appService);
    final params = metaDTO.getParams(
      appService,
      amount,
      toAddress,
    );

    await Transfer(
      txInfo: txInfo,
      params: params,
      // amount: amountController.text,
      appService: appService,
      context: context,
      toAddress: toAddress,
      password: password,
      formKey: formKey,
    ).sendFunds();
  }
}

class TransferInfo {
  // Max avaliable balance in wallet in human-readable double format
  final String balance;
  final TxFeeEstimateResult? fees;

  const TransferInfo({
    required this.balance,
    required this.fees,
  });
}
