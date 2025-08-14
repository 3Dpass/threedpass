import 'package:threedpass/core/call_extrinsic_usecase.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/domain/entities/claim_poscan_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/poscan_atomic_swap_repository.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/domain/usecases/claim_poscan_atomic_swap_global_handler.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/utils/primitive_event_logs_handler.dart';

class ClaimPoscanAtomicSwap extends CallExtrinsicUsecase<
    ClaimPoscanAtomicSwapParams, NotificationClaimPoscanAtomicSwap> {
  @override
  final AppServiceLoaderCubit appServiceLoaderCubit;
  @override
  final NotificationsBloc notificationsBloc;

  final PoscanAtomicSwapRepository atomicSwapRepository;
  final PoolsCubit poolsCubit;
  final PoscanAssetsCubit poscanAssetsCubit;
  final PendingAtomicSwapCubit pendingAtomicSwapCubit;

  const ClaimPoscanAtomicSwap({
    required this.appServiceLoaderCubit,
    required this.notificationsBloc,
    required this.atomicSwapRepository,
    required this.pendingAtomicSwapCubit,
    required this.poscanAssetsCubit,
    required this.poolsCubit,
  });

  @override
  PrimitiveEventLogsHandler<NotificationClaimPoscanAtomicSwap> globalHandler({
    required String msgId,
    required NotificationsBloc notificationsBloc,
    required NotificationClaimPoscanAtomicSwap initialN,
  }) =>
      ClaimPoscanAtomicSwapGlobalHandler(
        msgId: msgId,
        notificationsBloc: notificationsBloc,
        initialN: initialN,
        webViewRunner:
            appServiceLoaderCubit.state.plugin.sdk.api.service.webView!,
        pendingAtomicSwapCubit: pendingAtomicSwapCubit,
        appServiceLoaderCubit: appServiceLoaderCubit,
        poscanAssetsCubit: poscanAssetsCubit,
        poolsCubit: poolsCubit,
      );

  @override
  NotificationClaimPoscanAtomicSwap notificationLoading(
    ClaimPoscanAtomicSwapParams params,
  ) =>
      NotificationClaimPoscanAtomicSwap(
        swap: params.swap,
        status: ExtrinsicStatus.loading,
        message: null,
      );

  @override
  RepositoryCall<ClaimPoscanAtomicSwapParams> get repositoryCall =>
      atomicSwapRepository.claim;
}
