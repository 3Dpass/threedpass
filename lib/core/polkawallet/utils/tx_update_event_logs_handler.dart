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

  @override
  void onError(final String? msg) {
    setTransactionResult(
      status: ExtrinsicStatus.error,
      message: msg,
    );
  }

  @override
  void onExtrinsicFailed(final String? msg) {
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
