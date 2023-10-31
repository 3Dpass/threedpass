import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:polkawallet_sdk/utils/web_logs_handler.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/setup.dart';

typedef TransactionsCallback = void Function({
  required ExtrisincStatus status,
  required String? message,
});

class TxUpdateEventLogsHandler extends WebLogsHandler {
  const TxUpdateEventLogsHandler(
    this.msgId,
    this.setTransactionResult,
  );

  final String msgId;

  final TransactionsCallback setTransactionResult;

  static const String extrinsicSuccess = 'ok';

  @override
  void handle(final String data) {
    final dynamic rawData = jsonDecode(data);

    if (!(rawData is Map &&
        rawData.keys.contains('path') &&
        rawData.keys.contains('data'))) {
      return;
    }

    final dynamic path = rawData['path'];

    if (!(path is String && path.contains('txUpdateEvent|msgId=$msgId'))) {
      return;
    }

    final dynamic dataSection = rawData['data'];

    if (!(dataSection is Map &&
        dataSection.keys.contains('title') &&
        dataSection.keys.contains('message'))) {
      return;
    }

    final String title = dataSection['title'] as String;
    final String message = dataSection['message'] as String;
    debugPrint('$title $message');

    if (title == "system.ExtrinsicSuccess") {
      getIt<Logger>().d('Found ExtrinsicSuccess for $msgId');
      setTransactionResult(status: ExtrisincStatus.success, message: null);
    } else if (title == 'system.ExtrinsicFailed') {
      getIt<Logger>().d('Found ExtrinsicFailed for $msgId');
      setTransactionResult(
        status: ExtrisincStatus.failed,
        message: message,
      );
    }

    if (title.contains('error')) {
      if (message.contains('password check failed')) {
        setTransactionResult(
          status: ExtrisincStatus.error,
          message: message,
        );
      } else {
        setTransactionResult(
          status: ExtrisincStatus.failed,
          message: message,
        );
      }
    }
  }
}
