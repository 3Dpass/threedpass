import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/tx_update_event_logs_handler.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';

class Transfer {
  Transfer({
    required this.txInfo,
    required this.params,
    required this.appService,
    required this.context,
    required this.formKey,
    required this.password,
    required this.toAddress,
    required this.notificationsCubit,
    required this.addHandler,
    required this.symbols,
    required this.decimals,
    required this.amountNotification,
  });

  // final String amount;
  final AppService appService;
  final TxInfoData txInfo;
  final List<String> params;
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final String password;
  final String toAddress;
  final NotificationsCubit notificationsCubit;
  final void Function(String, void Function(String)) addHandler;
  final String symbols;
  final int decimals;
  final String amountNotification;

  bool isFinished = false;

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

      final tmpN = NotificationDTO(
        type: NotificationType.transfer,
        status: ExtrisincStatus.loading,
        toAddresses: [toAddress],
        fromAddresses: [txInfo.sender?.address ?? ''],
        amount:
            amountNotification, //BalanceUtils.balanceToDouble(params[1], decimals).toString(),
        symbols: symbols,
        blockDateTime: null,
      );
      // int i = 0;

      notificationsCubit.add(tmpN);

      try {
        final d1 = await appService.plugin.sdk.api.tx.signAndSend(
          txInfo,
          params,
          password,
          onStatusChange: (final p0) {
            // There are two calls of this callback: p0 == 'Ready' and p0 == 'Broadcast'
            // print(p0 + ' ' + params.toString());
            switch (p0) {
              case 'Ready':
                // final readN = tmpN.copyWith(status: TransactionStatus.pending,);
                // notificationsCubit.replace(tmpN, readN);
                // tmpN = readN;

                DefaultLoadingDialog.hide(globalContext);
                context.router.pop();
                Fluttertoast.showToast(msg: 'transfer_success_text'.tr());
                break;

              case 'Broadcast':
                // i++;

                // final readN = tmpN.copyWith(status:TransactionStatus.pending,);
                // notificationsCubit.replace(tmpN, readN);
                // tmpN = readN;

                debugPrint('Broadcast');

              default:
                debugPrint(p0);
            }
          },
          msgIdCallback: (final String msgId) {
            debugPrint('SET MSG ID $msgId');
            addHandler(
              msgId,
              (final String p0) {
                isFinished = true;
                final finishedTransaction = tmpN.copyWith(
                  status: p0 == TxUpdateEventLogsHandler.extrinsicSuccess
                      ? ExtrisincStatus.success
                      : ExtrisincStatus.failed,
                  message: p0,
                  blockDateTime: DateTime.now().toUtc(),
                );
                notificationsCubit.replace(tmpN, finishedTransaction);
              },
            );
          },
        );
        // final b = 1 + 1;
        // print('Finished');
      } on Object catch (e) {
        // print('aaaaaaaaaaaa');
        // final a = globalContext.router.stack;

        try {
          final ___ = context.router.stack;
          DefaultLoadingDialog.hide(globalContext);
          // DIALOG WAS NOT CLOSED
        } on Object catch (_) {
          // DIALOG WAS CLOSED
          debugPrint('dialog was closed');
        }

        if (!isFinished) {
          final finishedTransaction = tmpN.copyWith(
            status: ExtrisincStatus.error,
            message: e.toString(),
            blockDateTime: DateTime.now().toUtc(),
          );
          notificationsCubit.replace(tmpN, finishedTransaction);
        }

        unawaited(Fluttertoast.showToast(msg: e.toString()));
      }
    }
  }
}
