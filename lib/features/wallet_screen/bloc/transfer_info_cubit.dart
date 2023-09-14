import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';

part 'transfer_info_cubit.g.dart';

class TransferInfoCubit extends Cubit<TransferInfo> {
  TransferInfoCubit({
    required final double balance,
    required this.metaDTO,
    required this.appService,
  }) : super(
          TransferInfo(
            balance: balance,
            fees: null,
            type: TransferTypeValue.defaultType,
          ),
        );

  final TransferMetaDTO metaDTO;
  final AppService appService;

  Future<void> init() async {
    final txInfo = metaDTO.getTxInfo(state.type);
    final params = metaDTO.getParams(
      '10',
      appService.userSenderData.address.toString(),
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

    emit(state.copyWith(fees: fee));
  }

  Future<void> sendTransfer({
    required final String amount,
    required final String toAddress,
    required final BuildContext context,
    required final String password,
    required final GlobalKey<FormState> formKey,
  }) async {
    try {
      final txInfo = metaDTO.getTxInfo(state.type);
      final params = metaDTO.getParams(
        amount,
        toAddress,
      );

      final notificationsCubit = BlocProvider.of<NotificationsCubit>(context);
      final appServiceCubit = BlocProvider.of<AppServiceLoaderCubit>(context);

      // print(metaDTO.getName());

      await Transfer(
        txInfo: txInfo,
        params: params,
        appService: appService,
        context: context,
        toAddress: toAddress,
        password: password,
        formKey: formKey,
        notificationsCubit: notificationsCubit,
        addHandler: appServiceCubit.addHandler,
        symbols: metaDTO.getName(),
        decimals: metaDTO.decimals,
      ).sendFunds();
    } on Exception catch (e) {
      await Fluttertoast.showToast(msg: e.toString());
    }
  }

  void updateTransferType(final TransferType type) {
    emit(state.copyWith(type: type));
  }
}

@CopyWith()
class TransferInfo {
  // Max avaliable balance in wallet in human-readable double format
  final double balance;
  final TxFeeEstimateResult? fees;
  final TransferType type;

  const TransferInfo({
    required this.balance,
    required this.fees,
    required this.type,
  });
}
