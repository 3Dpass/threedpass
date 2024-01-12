import 'dart:async';

import 'package:polkawallet_sdk/p3d/tx_info.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_type_enum.dart';

abstract class _TransferRepository {
  const _TransferRepository({
    required this.appService,
    required this.onStatusChange,
    required this.msgIdCallback,
  });

  final AppService appService;
  // final BuildContext context;
  // final BuildContext globalContext;
  // final void Function(Map<List<String>, String> data, TransferType transferType)
  //     addHandler;

  final void Function(String p0) onStatusChange;
  final void Function(Map<List<String>, String> data) msgIdCallback;

  TransferType get transferType;

  // Future<void> send() async {
  //   try {
  //     unawaited(useApi());
  //     // final b = 1 + 1;
  //     // print('Finished');
  //   } on Object catch (e) {
  //     debugPrint('USE API CATCH');
  //     try {
  //       // DO NOT REMOVE THIS LINE
  //       // It throws an error if old context doesn't exist. Otherwise it will
  //       // close the dialog.
  //       debugPrint('check if transfer dialog was closed');
  //       final ___ = context.router.stack;
  //       // debugPrint('close transfer dialog');
  //       DefaultLoadingDialog.hide(globalContext);
  //       // DIALOG WAS NOT CLOSED
  //     } on Object catch (_) {
  //       // DIALOG WAS CLOSED
  //       debugPrint('transfer dialog was already closed');
  //     }

  //     // finishNotificationWithError(e.toString());
  //     debugPrint(e.toString());
  //     // unawaited(Fluttertoast.showToast(msg: e.toString()));
  //   }

  //   try {
  //     // DO NOT REMOVE THIS LINE
  //     // It throws an error if old context doesn't exist. Otherwise it will
  //     // close the dialog.
  //     debugPrint('FINISH TRANSFER SCREEN. check if transfer dialog was closed');
  //     final ___ = context.router.stack;
  //     // debugPrint('close transfer dialog');
  //     DefaultLoadingDialog.hide(globalContext);

  //     // DIALOG WAS NOT CLOSED
  //   } on Object catch (_) {
  //     // DIALOG WAS CLOSED
  //     debugPrint('FINISH TRANSFER SCREEN. transfer dialog was already closed');
  //   }

  //   try {
  //     unawaited(context.router.pop());
  //   } on Object catch (_) {
  //     // DIALOG WAS CLOSED
  //     debugPrint('FINISH TRANSFER SCREEN. Catch. context.router.pop();');
  //   }
  // }

  Future<Map<dynamic, dynamic>> useApi();

  // void onStatusChange(final String p0) {
  //   // There are two calls of this callback: p0 == 'Ready' and p0 == 'Broadcast'
  //   // print(p0 + ' ' + params.toString());
  //   // switch (p0) {
  //   //   case 'Ready':
  //   //     debugPrint('Got ready status');
  //   //     try {
  //   //       // DO NOT REMOVE THIS LINE
  //   //       // It throws an error if old context doesn't exist. Otherwise it will
  //   //       // close the dialog.
  //   //       debugPrint('Check if already got ready status');
  //   //       final ___ = context.router.stack;
  //   //       DefaultLoadingDialog.hide(globalContext);
  //   //       context.router.pop();
  //   //       Fluttertoast.showToast(msg: 'transfer_success_text'.tr());
  //   //       // DIALOG WAS NOT CLOSED
  //   //     } on Object catch (_) {
  //   //       // DIALOG WAS CLOSED
  //   //       debugPrint('Ready status was already got somewhere');
  //   //     }
  //   //     break;

  //   //   case 'Broadcast':
  //   //     debugPrint('Broadcast');

  //   //   default:
  //   //     debugPrint(p0);
  //   // }
  // }

  // void msgIdCallback(final Map<List<String>, String> data) {
  //   // debugPrint('SET MSG ID $msgId');
  //   addHandler(data, transferType);
  // }
}

class SingleTransaction extends _TransferRepository {
  const SingleTransaction({
    required super.appService,
    required this.password,
    required this.txInfoMeta,
    required super.onStatusChange,
    required super.msgIdCallback,
  }) : super();

  final TransferTxInfoI txInfoMeta;
  final String password;

  @override
  TransferType get transferType => TransferType.oneToOne;

  @override
  Future<Map<dynamic, dynamic>> useApi() async {
    final d1 = await appService.plugin.sdk.api.tx.signAndSend(
      txInfo: txInfoMeta,
      password: password,
      onStatusChange: onStatusChange,
      msgIdCallback: msgIdCallback,
    );
    return d1;
  }
}

class MultiTxSingleSender extends _TransferRepository {
  const MultiTxSingleSender({
    required super.appService,
    required this.txInfoMetas,
    required this.password,
    required super.onStatusChange,
    required super.msgIdCallback,
  }) : super();

  final List<TransferTxInfoI> txInfoMetas;
  final String password;

  @override
  TransferType get transferType => TransferType.oneToMany;

  @override
  Future<Map<dynamic, dynamic>> useApi() async {
    final d1 = await appService.plugin.sdk.api.tx.sendMultiTxSingleSender(
      txInfoMetas: txInfoMetas,
      password: password,
      onStatusChange: onStatusChange,
      msgIdCallback: msgIdCallback,
    );
    return d1;
  }
}

class MultiTxMultiSender extends _TransferRepository {
  const MultiTxMultiSender({
    required super.appService,
    required this.passwords,
    required this.txInfoMetas,
    required super.onStatusChange,
    required super.msgIdCallback,
  }) : super();

  final List<TransferTxInfoI> txInfoMetas;
  final List<String> passwords;

  @override
  TransferType get transferType => TransferType.manyToOne;

  @override
  Future<Map<dynamic, dynamic>> useApi() async {
    final d1 = await appService.plugin.sdk.api.tx.sendMultiTxMultiSender(
      txInfoMetas: txInfoMetas,
      passwords: passwords,
      onStatusChange: onStatusChange,
      msgIdCallback: msgIdCallback,
    );
    return d1;
  }
}
