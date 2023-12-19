import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:polkawallet_sdk/p3d/tx_info.dart';
import 'package:polkawallet_sdk/p3d/tx_params.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/bloc/transfer_info_bloc.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/entities/transaction.dart';

class Transfer {
  Transfer({
    // required this.params,
    required this.appService,
    required this.context,
    required this.formKey,
    required this.notificationsBloc,
    required this.appServiceCubit,
    required this.symbols,
    required this.decimals,
    // required this.amounts,
    required this.passwords,
    required this.metaInfos,
    // required this.txInfos,
  });

  // final String amount;
  final AppService appService;
  final List<TransferTxInfoI> metaInfos;
  // final List<TxInfoData> txInfos;
  // final List<TxParams> params;
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final List<String> passwords;
  final NotificationsBloc notificationsBloc;
  // final void Function(String, TransactionsCallback) addHandler;
  final AppServiceLoaderCubit appServiceCubit;
  final String symbols;
  final int decimals;
  // final List<String> amounts;

  Future<bool> checkAddressAndNotify(final String toAddress) async {
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

  Future<bool> checkAllAddresses(final List<TxParams> params) async {
    for (final p in params) {
      if (!await checkAddressAndNotify(p.toAddress)) {
        return false;
      }
    }

    return true;
  }

  void addAllNs(final List<NotificationDTO> ns) {
    for (final n in ns) {
      notificationsBloc.add(AddNotification(n));
    }
  }

  Future<void> sendFunds() async {
    if (formKey.currentState!.validate()) {
      final params = metaInfos.map((final e) => e.params()).toList();
      final addressCorrect = await checkAllAddresses(params);

      if (!addressCorrect) {
        return;
      }

      final fromAddress =
          metaInfos.map((final e) => e.txInfo().sender!.address!).toList();
      final uniqueFromAddresses = Set<String>.from(fromAddress).toList();

      if (uniqueFromAddresses.length != passwords.length) {
        debugPrint(
          'params.length != txInfos.length || txInfos.length != passwords.length',
        );
        return;
      }

      final toAddresses = params.map((final e) => e.toAddress).toList();
      final uniqueToAddresses = Set<String>.from(toAddresses).toList();

      final amounts = params
          .map((final e) => e.amount)
          .map((final e) => e.toString())
          .toList();

      final globalContext =
          BlocProvider.of<HomeContextCubit>(context).state.context;

      DefaultLoadingDialog.show(globalContext, 'transfer_loader_text'.tr());

      final notifications = <NotificationDTO>[];

      for (int i = 0; i < metaInfos.length; i++) {
        notifications.add(
          NotificationTransfer(
            status: ExtrisincStatus.loading,
            toAddress: toAddresses[i],
            fromAddress: fromAddress[i],
            amount: amounts[i],
            symbols: symbols,
            blockDateTime: null,
            message: null,
          ),
        );
      }

      final addHandlerV = (final Map<List<String>, String> data) {
        for (final k in data.keys) {
          final msgId = data[k]!;
          debugPrint('Add handler for $msgId');

          appServiceCubit.addHandler(
            msgId,
            ({
              required final ExtrisincStatus status,
              required final String? message,
            }) {
              // isFinished = true;
              final tmp = notifications.firstWhere((final element) {
                if (element.type == NotificationType.transfer) {
                  element as NotificationTransfer;
                  return element.fromAddress == k.first &&
                      element.toAddress == k.last;
                }
                return false;
              });

              final finishedTransaction =
                  (tmp as NotificationTransfer).copyWith(
                status: status,
                message: message,
                blockDateTime: DateTime.now(),
              );
              notificationsBloc.add(
                UpdateNotification(newN: finishedTransaction, oldN: tmp),
              );
            },
          );
        }
      };

      await caseSplit(
        txInfos: uniqueFromAddresses,
        params: uniqueToAddresses,
        passwords: passwords,
        onFirst: () async {
          addAllNs(notifications);
          debugPrint('SingleTransaction');
          unawaited(
            SingleTransaction(
              addHandler: addHandlerV,
              appService: appService,
              context: context,
              // finishNotificationWithError: finishNotificationWithErrorV,
              globalContext: globalContext,
              password: passwords.first,
              txInfoMeta: metaInfos.first,
            ).send(),
          );
        },
        onSecond: () async {
          addAllNs(notifications);
          debugPrint('MultiTxSingleSender');
          unawaited(MultiTxSingleSender(
            addHandler: addHandlerV,
            appService: appService,
            context: context,
            // finishNotificationWithError: finishNotificationWithErrorV,
            globalContext: globalContext,
            // params: params.map((final e) => e.paramsToSend()).toList(),
            password: passwords.first,
            txInfoMetas: metaInfos,
          ).send());
        },
        onThird: () async {
          addAllNs(notifications);
          debugPrint('MultiTxMultiSender');
          unawaited(
            MultiTxMultiSender(
              addHandler: addHandlerV,
              appService: appService,
              context: context,
              // finishNotificationWithError: finishNotificationWithErrorV,
              globalContext: globalContext,
              // txInfos: txInfos,
              // params: params.map((final e) => e.paramsToSend()).toList(),
              txInfoMetas: metaInfos,
              passwords: passwords,
            ).send(),
          );
        },
        onError: () async {
          debugPrint('Transfer case split Error');
          DefaultLoadingDialog.hide(globalContext);
          unawaited(
            Fluttertoast.showToast(msg: 'Transfer error when case split.'),
          );
        },
      );
    }
  }
}
