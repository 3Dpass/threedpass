import 'dart:convert';

import 'package:polkawallet_sdk/utils/web_logs_handler.dart';

class TxUpdateEventLogsHandler extends WebLogsHandler {
  const TxUpdateEventLogsHandler(
    this.msgId,
    this.setTransactionResult,
  );

  final String msgId;
  final void Function(String) setTransactionResult;

  static const String extrinsicSuccess = 'ok';

  @override
  void handle(String data) {
    // final dynamic d1 = jsonDecode(data);

    final dynamic rawData = jsonDecode(data);

    // final d2 = !(rawData is Map);

    if (!(rawData is Map)) {
      return;
    }

    final Map<String, dynamic> jsonData = <String, dynamic>{};

    for (final key in rawData.keys) {
      jsonData[key.toString()] = rawData[key];
    }

    final dynamic path = jsonData['path'];

    if (!(path is String && path.contains('txUpdateEvent|msgId=$msgId'))) {
      return;
    }

    if (!jsonData.keys.contains('data')) {
      return;
    }
    final dynamic dataSection = jsonData['data'];

    if (!(dataSection is Map &&
        dataSection.keys.contains('title') &&
        dataSection.keys.contains('message'))) {
      return;
    }

    final String title = dataSection['title'] as String;
    if (title == "system.ExtrinsicSuccess") {
      setTransactionResult(dataSection['message'] as String);
    }
  }
}
