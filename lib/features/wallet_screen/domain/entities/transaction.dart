import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:polkawallet_sdk/p3d/tx_info.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';

abstract class _Transaction {
  const _Transaction({
    required this.addHandler,
    required this.appService,
    required this.context,
    required this.finishNotificationWithError,
    required this.globalContext,
  });

  final AppService appService;
  final BuildContext context;
  final BuildContext globalContext;
  final void Function(Map<List<String>, String> data) addHandler;
  final void Function(String error) finishNotificationWithError;

  Future<void> send() async {
    try {
      unawaited(useApi());
      // final b = 1 + 1;
      // print('Finished');
    } on Object catch (e) {
      try {
        // DO NOT REMOVE THIS LINE
        // It throws an error if old context doesn't exist. Otherwise it will
        // close the dialog.
        debugPrint('check if transfer dialog was closed');
        final ___ = context.router.stack;
        // debugPrint('close transfer dialog');
        DefaultLoadingDialog.hide(globalContext);
        // DIALOG WAS NOT CLOSED
      } on Object catch (_) {
        // DIALOG WAS CLOSED
        debugPrint('transfer dialog was already closed');
      }

      finishNotificationWithError(e.toString());
      debugPrint(e.toString());
      // unawaited(Fluttertoast.showToast(msg: e.toString()));
    }

    try {
      // DO NOT REMOVE THIS LINE
      // It throws an error if old context doesn't exist. Otherwise it will
      // close the dialog.
      debugPrint('FINISH TRANSFER SCREEN. check if transfer dialog was closed');
      final ___ = context.router.stack;
      // debugPrint('close transfer dialog');
      DefaultLoadingDialog.hide(globalContext);

      // DIALOG WAS NOT CLOSED
    } on Object catch (_) {
      // DIALOG WAS CLOSED
      debugPrint('FINISH TRANSFER SCREEN. transfer dialog was already closed');
    }

    try {
      unawaited(context.router.pop());
    } on Object catch (_) {
      // DIALOG WAS CLOSED
      debugPrint('FINISH TRANSFER SCREEN. Catch. context.router.pop();');
    }
  }

  Future<void> useApi();

  void onStatusChange(final String p0) {
    // There are two calls of this callback: p0 == 'Ready' and p0 == 'Broadcast'
    // print(p0 + ' ' + params.toString());
    // switch (p0) {
    //   case 'Ready':
    //     debugPrint('Got ready status');
    //     try {
    //       // DO NOT REMOVE THIS LINE
    //       // It throws an error if old context doesn't exist. Otherwise it will
    //       // close the dialog.
    //       debugPrint('Check if already got ready status');
    //       final ___ = context.router.stack;
    //       DefaultLoadingDialog.hide(globalContext);
    //       context.router.pop();
    //       Fluttertoast.showToast(msg: 'transfer_success_text'.tr());
    //       // DIALOG WAS NOT CLOSED
    //     } on Object catch (_) {
    //       // DIALOG WAS CLOSED
    //       debugPrint('Ready status was already got somewhere');
    //     }
    //     break;

    //   case 'Broadcast':
    //     debugPrint('Broadcast');

    //   default:
    //     debugPrint(p0);
    // }
  }

  void msgIdCallback(final Map<List<String>, String> data) {
    // debugPrint('SET MSG ID $msgId');
    addHandler(data);
  }
}

class SingleTransaction extends _Transaction {
  const SingleTransaction({
    required super.addHandler,
    required super.appService,
    required super.context,
    required super.finishNotificationWithError,
    required super.globalContext,
    required this.password,
    required this.txInfoMeta,
  }) : super();

  final TransferTxInfoI txInfoMeta;
  final String password;

  @override
  Future<void> useApi() async {
    final d1 = await appService.plugin.sdk.api.tx.signAndSend(
      txInfo: txInfoMeta,
      password: password,
      onStatusChange: onStatusChange,
      msgIdCallback: msgIdCallback,
    );
    print(d1);
  }
}

class MultiTxSingleSender extends _Transaction {
  const MultiTxSingleSender({
    required super.addHandler,
    required super.appService,
    required super.context,
    required super.finishNotificationWithError,
    required super.globalContext,
    required this.txInfoMetas,
    required this.password,
  }) : super();

  final List<TransferTxInfoI> txInfoMetas;
  final String password;

  @override
  Future<void> useApi() async {
    final d1 = await appService.plugin.sdk.api.tx.sendMultiTxSingleSender(
      txInfoMetas: txInfoMetas,
      password: password,
      onStatusChange: onStatusChange,
      msgIdCallback: msgIdCallback,
    );
    print(d1);
  }
}

class MultiTxMultiSender extends _Transaction {
  const MultiTxMultiSender({
    required super.addHandler,
    required super.appService,
    required super.context,
    required super.finishNotificationWithError,
    required super.globalContext,
    required this.passwords,
    required this.txInfoMetas,
  }) : super();

  final List<TransferTxInfoI> txInfoMetas;
  final List<String> passwords;

  @override
  Future<void> useApi() async {
    final d1 = await appService.plugin.sdk.api.tx.sendMultiTxMultiSender(
      txInfoMetas: txInfoMetas,
      passwords: passwords,
      onStatusChange: onStatusChange,
      msgIdCallback: msgIdCallback,
    );
    print(d1);
  }
}
