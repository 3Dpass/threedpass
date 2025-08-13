import 'package:threedpass/core/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

extension SwapInProgress on NotificationsBloc {
  static bool isCreating(
          final HexEx givenProof, final NotificationDTO notification) =>
      notification.type == NotificationType.claimPoscanAtomicSwap &&
      (notification as NotificationClaimPoscanAtomicSwap).swap.hashProof ==
          givenProof;

  static bool isCancelling(
          final HexEx givenProof, final NotificationDTO notification) =>
      notification.type == NotificationType.cancelPoscanAtomicSwap &&
      (notification as NotificationCancelPoscanAtomicSwap).swap.hashProof ==
          givenProof;

  bool isSwapInProgress(final HexEx proof) => state.notifications.any(
        (final e) => isCreating(proof, e) || isCancelling(proof, e),
      );
}
