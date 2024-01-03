import 'package:threedpass/core/polkawallet/utils/basic_event_logs_handler.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';

typedef TransactionsCallback = void Function({
  required ExtrinsicStatus status,
  required String? message,
});

class TxUpdateEventLogsHandler extends BasicEventLogsHandler {
  const TxUpdateEventLogsHandler({
    required super.msgId,
    required super.webViewRunner,
    required this.setTransactionResult,
  });

  final TransactionsCallback setTransactionResult;

  // static const String extrinsicSuccess = 'ok';

  // @override
  // void handle(final String data) {
  //   final dynamic rawData = jsonDecode(data);

  //   if (!(rawData is Map &&
  //       rawData.keys.contains('path') &&
  //       rawData.keys.contains('data'))) {
  //     return;
  //   }

  //   final dynamic path = rawData['path'];

  //   if (!(path is String && path.contains('txUpdateEvent|msgId=$msgId'))) {
  //     return;
  //   }

  //   final dynamic dataSection = rawData['data'];

  //   if (!(dataSection is Map &&
  //       dataSection.keys.contains('title') &&
  //       dataSection.keys.contains('message'))) {
  //     return;
  //   }

  //   final String title = dataSection['title'] as String;
  //   final String message = dataSection['message'] as String;
  //   debugPrint('$title $message');

  //   if (title == "system.ExtrinsicSuccess") {
  //     getIt<Logger>().d('Found ExtrinsicSuccess for $msgId');
  //     setTransactionResult(status: ExtrinsicStatus.success, message: null);
  //   } else if (title == 'system.ExtrinsicFailed') {
  //     getIt<Logger>().d('Found ExtrinsicFailed for $msgId');
  //     setTransactionResult(
  //       status: ExtrinsicStatus.failed,
  //       message: message,
  //     );
  //   }

  //   if (title.contains('error')) {
  //     if (message.contains('password check failed')) {
  //       setTransactionResult(
  //         status: ExtrinsicStatus.error,
  //         message: message,
  //       );
  //     } else {
  //       setTransactionResult(
  //         status: ExtrinsicStatus.failed,
  //         message: message,
  //       );
  //     }
  //   }
  // }

  @override
  void onError(final String msg) {
    setTransactionResult(
      status: ExtrinsicStatus.error,
      message: msg,
    );
  }

  @override
  void onExtrinsicFailed(final String msg) {
    setTransactionResult(
      status: ExtrinsicStatus.failed,
      message: msg,
    );
  }

  @override
  void onExtrinsicSuccess() {
    setTransactionResult(
      status: ExtrinsicStatus.success,
      message: null,
    );
  }
}
