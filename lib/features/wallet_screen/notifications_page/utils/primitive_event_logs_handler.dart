import 'package:threedpass/core/polkawallet/utils/basic_event_logs_handler.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

abstract class PrimitiveEventLogsHandler<T extends NotificationDTO>
    extends BasicEventLogsHandler {
  final NotificationsBloc notificationsBloc;
  final T initialN;

  const PrimitiveEventLogsHandler({
    required super.msgId,
    required this.notificationsBloc,
    required this.initialN,
    required super.webViewRunner,
  });

  T customCopyWith(
    final T initialN,
    final ExtrinsicStatus status,
    final String? message,
  );

  void updateNotification(final ExtrinsicStatus status, final String? message) {
    final notificationNew = customCopyWith(initialN, status, message);

    notificationsBloc.add(
      UpdateNotification(
        newN: notificationNew,
        oldN: initialN,
      ),
    );
  }

  @override
  void onError(final String? msg) =>
      updateNotification(ExtrinsicStatus.error, msg);

  @override
  void onExtrinsicFailed(final String? msg) =>
      updateNotification(ExtrinsicStatus.failed, msg);

  @override
  void onExtrinsicSuccess() =>
      updateNotification(ExtrinsicStatus.success, null);
}
