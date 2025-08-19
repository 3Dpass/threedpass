import 'package:threedpass/core/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

extension SwapInProgress on NotificationsState {
  static bool isClaiming(
          final HexEx givenProof, final NotificationDTO notification) =>
      notification.type == NotificationType.claimPoscanAtomicSwap &&
      (notification as NotificationClaimPoscanAtomicSwap).swap.hashProof ==
          givenProof;

  static bool isCancelling(
          final HexEx givenProof, final NotificationDTO notification) =>
      notification.type == NotificationType.cancelPoscanAtomicSwap &&
      (notification as NotificationCancelPoscanAtomicSwap).swap.hashProof ==
          givenProof;

  bool isSwapInProgress(final HexEx proof) => notifications.any(
        (final e) =>
            e.status == ExtrinsicStatus.loading && isClaiming(proof, e) ||
            isCancelling(proof, e),
      );
}
