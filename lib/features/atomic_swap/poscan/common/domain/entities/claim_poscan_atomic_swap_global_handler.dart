import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/utils/primitive_event_logs_handler.dart';

class ClaimPoscanAtomicSwapGlobalHandler
    extends PrimitiveEventLogsHandler<NotificationClaimPoscanAtomicSwap> {
  const ClaimPoscanAtomicSwapGlobalHandler({
    required super.msgId,
    required super.notificationsBloc,
    required super.initialN,
    required super.webViewRunner,
    required this.pendingAtomicSwapCubit,
  });

  final PendingAtomicSwapCubit pendingAtomicSwapCubit;

  @override
  NotificationClaimPoscanAtomicSwap customCopyWith(
    final NotificationClaimPoscanAtomicSwap initialN,
    final ExtrinsicStatus status,
    final String? message,
  ) {
    return initialN.copyWith(status: status, message: message);
  }

  @override
  void onExtrinsicSuccess() {
    updateNotification(ExtrinsicStatus.success, null);
    pendingAtomicSwapCubit.init();
  }
}
