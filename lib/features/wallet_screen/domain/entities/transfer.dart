import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';

class Transfer {
  const Transfer({
    required this.amount,
    required this.appService,
    required this.context,
    required this.formKey,
    required this.password,
    required this.toAddress,
  });

  final String amount;
  final AppService appService;
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final String password;
  final String toAddress;

  Future<bool> checkAddressAndNotify() async {
    final addressCorrect =
        await appService.plugin.sdk.api.account.checkAddressFormat(
      toAddress,
      appService.networkStateData.ss58Format!,
    );

    if (addressCorrect == null) {
      Fluttertoast.showToast(msg: 'could_not_check_address'.tr());
      return false;
    }

    if (!addressCorrect) {
      Fluttertoast.showToast(msg: 'wrong_address'.tr());
      return false;
    }

    return true;
  }

  BigInt get realAmount => BalanceUtils.tokenInt(
        amount,
        appService.networkStateData.safeDecimals,
      );

  TxInfoData get txInfo => TxInfoData(
        'balances',
        'transfer',
        TxSenderData(
          appService.keyring.current.address,
          appService.keyring.current.pubKey,
        ),
      );

  List<dynamic> get params => [
        // params.to
        toAddress,
        // params.amount
        realAmount.toString(),
      ];

  Future<void> sendFunds() async {
    if (formKey.currentState!.validate()) {
      final addressCorrect = await checkAddressAndNotify();

      if (!addressCorrect) {
        return;
      }

      final outerContext = BlocProvider.of<OuterContextCubit>(context).state;
      // Very dangerous showDialog
      DefaultLoadingDialog.show(outerContext, 'transfer_loader_text'.tr());

      try {
        final res = await appService.plugin.sdk.api.tx.signAndSend(
          txInfo,
          params,
          password,
          onStatusChange: (p0) {
            // There are two calls of this callback: p0 == 'Ready' and p0 == 'Broadcast'
            if (p0 == 'Ready') {
              DefaultLoadingDialog.hide(outerContext);
              context.router.pop();
              Fluttertoast.showToast(msg: 'transfer_success_text'.toString());
            }
          },
        );
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }

      // This works only when the transaction is impossible. I don't know why.
      DefaultLoadingDialog.hide(outerContext);

      final b = 1 + 1;
    }
  }
}
