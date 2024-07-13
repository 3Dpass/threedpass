import 'dart:convert';

import 'package:polkawallet_sdk/service/webViewRunner.dart';
import 'package:polkawallet_sdk/utils/web_logs_handler.dart';
import 'package:threedpass/core/utils/logger.dart';

abstract class BasicEventLogsHandler extends WebLogsHandler {
  const BasicEventLogsHandler({
    required this.msgId,
    required this.webViewRunner,
  });

  final String msgId;
  final WebViewRunner webViewRunner;

  static const String extrinsicSuccess = 'ok';

  void onExtrinsicSuccess();
  void onExtrinsicFailed(final String? msg);

  void onError(final String? msg);

  void dispose() {
    webViewRunner.removeGlobalHandler(this);
  }

  @override
  void handle(final String data) {
    final dynamic rawData = jsonDecode(data);

    if (!(rawData is Map &&
        rawData.keys.contains('path') &&
        rawData.keys.contains('data'))) {
      return;
    }

    final dynamic path = rawData['path'];

    if (!(path is String && path.contains('|msgId=$msgId'))) {
      return;
    }

    final dynamic dataSection = rawData['data'];

    if (!(dataSection is Map &&
        (dataSection.keys.contains('title') ||
            dataSection.keys.contains('message')))) {
      return;
    }

    final String? title = dataSection['title'] as String?;
    final String? message = dataSection['message'] as String?;
    logger.v('Found log $title $message');

    switch (title) {
      case 'system.ExtrinsicSuccess':
        logger.v('Found ExtrinsicSuccess for $msgId');
        onExtrinsicSuccess();
        dispose();
        break;
      case 'system.ExtrinsicFailed':
        logger.v('Found ExtrinsicFailed for $msgId');
        onExtrinsicFailed(message);
        dispose();
        break;
      default:
        if (title?.contains('error') ?? false) {
          onError(message);
          dispose();
        }
        break;
    }
  }
}
