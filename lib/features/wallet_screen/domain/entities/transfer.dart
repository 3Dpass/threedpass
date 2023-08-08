import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';

// TODO Add transfer options: keep_alive or just transfer
class Transfer {
  const Transfer({
    required this.txInfo,
    required this.params,
    required this.appService,
    required this.context,
    required this.formKey,
    required this.password,
    required this.toAddress,
  });

  // final String amount;
  final AppService appService;
  final TxInfoData txInfo;
  final List<String> params;
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
      unawaited(Fluttertoast.showToast(msg: 'could_not_check_address'.tr()));
      return false;
    }

    if (!addressCorrect) {
      unawaited(Fluttertoast.showToast(msg: 'wrong_address'.tr()));
      return false;
    }

    return true;
  }

  Future<void> sendFunds() async {
    if (formKey.currentState!.validate()) {
      final addressCorrect = await checkAddressAndNotify();

      if (!addressCorrect) {
        return;
      }

      final globalContext =
          BlocProvider.of<HomeContextCubit>(context).state.context;

      DefaultLoadingDialog.show(globalContext, 'transfer_loader_text'.tr());

      try {
        final __ = await appService.plugin.sdk.api.tx.signAndSend(
          txInfo,
          params,
          password,
          onStatusChange: (final p0) {
            // There are two calls of this callback: p0 == 'Ready' and p0 == 'Broadcast'
            // print(p0 + ' ' + params.toString());
            if (p0 == 'Ready') {
              DefaultLoadingDialog.hide(globalContext);
              context.router.pop();
              Fluttertoast.showToast(msg: 'transfer_success_text'.tr());
            }
          },
        );
        // final b = 1 + 1;
      } on Object catch (e) {
        try {
          DefaultLoadingDialog.hide(globalContext);
        } on Object catch (e) {
          unawaited(Fluttertoast.showToast(msg: e.toString()));
        }
        unawaited(Fluttertoast.showToast(msg: e.toString()));
      }
    }
  }
}
