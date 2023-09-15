import 'dart:convert';

import 'package:polkawallet_sdk/utils/web_logs_handler.dart';

class TxUpdateEventLogsHandler extends WebLogsHandler {
  const TxUpdateEventLogsHandler(
    this.msgId,
    this.setTransactionResult,
  );

  final String msgId;

  /// @param {String} is extrinsicSuccess or message
  final void Function(String) setTransactionResult;

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
    if (title == "system.ExtrinsicSuccess") {
      setTransactionResult(extrinsicSuccess);
    } else if (title == 'system.ExtrinsicFailed') {
      setTransactionResult(dataSection['message'] as String);
    }
  }
}
