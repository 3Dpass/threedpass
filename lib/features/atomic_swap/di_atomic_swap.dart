import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:threedpass/core/chains/domain/usecases/resolve_name_by_address.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/bloc/cancel_atomic_swap_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/bloc/claim_atomic_swap_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/poscan_atomic_swap_repository.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/bloc/create_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/usecases/calc_hashed_proof.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/usecases/create_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/usecases/get_pending_poscan_atomic_swap.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class DiAtomicSwap extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<PoscanAtomicSwapRepository>(
      () => PoscanAtomicSwapRepositoryImpl(
        callSignExtrinsicUtil: getIt<CallSignExtrinsicUtil>(),
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      ),
    );

    getIt.registerFactory<CalcHashedProof>(() => CalcHashedProof());
    getIt.registerFactory<CreateAtomicSwap>(
      () => CreateAtomicSwap(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        atomicSwapRepository: getIt<PoscanAtomicSwapRepository>(),
      ),
    );

    getIt.registerFactoryParam<CreateAtomicSwapCubit, int, StackRouter>(
      (final initialAssetId, final router) => CreateAtomicSwapCubit(
        outerRouter: router,
        calcHashedProof: getIt<CalcHashedProof>(),
        createAtomicSwap: getIt<CreateAtomicSwap>(),
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        poscanAssetsCubit: getIt<PoscanAssetsCubit>(),
      ),
    );

    getIt.registerSingletonAsync<CancelAtomicSwapBloc>(
      () async => CancelAtomicSwapBloc(),
    );
    getIt.registerSingletonAsync<ClaimAtomicSwapBloc>(
      () async => ClaimAtomicSwapBloc(),
    );
    getIt.registerFactory<GetPendingPoscanAtomicSwap>(
      () => GetPendingPoscanAtomicSwap(
        poscanAtomicSwapRepository: getIt<PoscanAtomicSwapRepository>(),
        resolveNameByAddress: getIt<ResolveNameByAddress>(),
      ),
    );
    getIt.registerSingletonAsync<PendingAtomicSwapCubit>(
      () async => PendingAtomicSwapCubit(
        getPendingPoscanAtomicSwap: getIt<GetPendingPoscanAtomicSwap>(),
      ),
    );
  }
}
