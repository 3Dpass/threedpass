import 'package:threedpass/core/call_extrinsic_usecase.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/atomic_swap_repository.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/entities/create_atomic_swap_global_handler.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/entities/create_atomic_swap_params.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/utils/primitive_event_logs_handler.dart';

class CreateAtomicSwap extends CallExtrinsicUsecase<CreateAtomicSwapParams,
    NotificationCreateAtomicSwap> {
  @override
  final AppServiceLoaderCubit appServiceLoaderCubit;
  @override
  final NotificationsBloc notificationsBloc;

  final AtomicSwapRepository atomicSwapRepository;

  const CreateAtomicSwap({
    required this.appServiceLoaderCubit,
    required this.notificationsBloc,
    required this.atomicSwapRepository,
  });

  @override
  PrimitiveEventLogsHandler<NotificationCreateAtomicSwap> globalHandler({
    required String msgId,
    required NotificationsBloc notificationsBloc,
    required NotificationCreateAtomicSwap initialN,
  }) =>
      CreateAtomicSwapGlobalHandler(
        msgId: msgId,
        notificationsBloc: notificationsBloc,
        initialN: initialN,
        webViewRunner:
            appServiceLoaderCubit.state.plugin.sdk.api.service.webView!,
      );

  @override
  NotificationCreateAtomicSwap notificationLoading(
    CreateAtomicSwapParams params,
  ) =>
      NotificationCreateAtomicSwap(
        from: params.account,
        to: params.target,
        status: ExtrinsicStatus.loading,
        message: null,
        isPoscan: params.action.isPoscan,
      );

  @override
  RepositoryCall<CreateAtomicSwapParams> get repositoryCall =>
      atomicSwapRepository.create;
}
