import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/utils/primitive_event_logs_handler.dart';

class CreateAtomicSwapGlobalHandler
    extends PrimitiveEventLogsHandler<NotificationCreateAtomicSwap> {
  const CreateAtomicSwapGlobalHandler({
    required super.msgId,
    required super.notificationsBloc,
    required super.initialN,
    required super.webViewRunner,
  });

  @override
  NotificationCreateAtomicSwap customCopyWith(
    final NotificationCreateAtomicSwap initialN,
    final ExtrinsicStatus status,
    final String? message,
  ) {
    return initialN.copyWith(status: status, message: message);
  }

  @override
  void onExtrinsicSuccess() {
    updateNotification(ExtrinsicStatus.success, null);
  }
}
