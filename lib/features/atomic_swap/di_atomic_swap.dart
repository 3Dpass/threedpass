import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:threedpass/core/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/core/chains/domain/usecases/encode_address.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/bloc/cancel_poscan_atomic_swap_bloc.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/domain/usecases/cancel_poscan_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/bloc/claim_poscan_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/poscan_atomic_swap_repository.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/domain/usecases/claim_poscan_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/bloc/create_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/usecases/calc_hashed_proof.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/usecases/create_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';
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
        pendingAtomicSwapCubit: getIt<PendingAtomicSwapCubit>(),
      ),
    );

    getIt.registerFactoryParam<CreateAtomicSwapCubit, int, StackRouter>(
      (final initialAssetId, final router) => CreateAtomicSwapCubit(
        outerRouter: router,
        createAtomicSwap: getIt<CreateAtomicSwap>(),
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        poscanAssetsCubit: getIt<PoscanAssetsCubit>(),
      ),
    );

    getIt.registerFactory<CancelPoscanAtomicSwap>(
      () => CancelPoscanAtomicSwap(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        atomicSwapRepository: getIt<PoscanAtomicSwapRepository>(),
        pendingAtomicSwapCubit: getIt<PendingAtomicSwapCubit>(),
      ),
    );
    getIt.registerFactoryParam<CancelPoscanAtomicSwapBloc,
        PendingPoscanAtomicSwap, StackRouter>(
      (
        final PendingPoscanAtomicSwap p1,
        final StackRouter p2,
      ) =>
          CancelPoscanAtomicSwapBloc(
        pendingSwap: p1,
        outerRouter: p2,
        accountToSignExtrinsic:
            getIt<CurrentAccountCubit>().state.value!.nativeP3D,
        cancelPoscanAtomicSwap: getIt<CancelPoscanAtomicSwap>(),
      ),
    );

    getIt.registerFactory<ClaimPoscanAtomicSwap>(
      () => ClaimPoscanAtomicSwap(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        atomicSwapRepository: getIt<PoscanAtomicSwapRepository>(),
        pendingAtomicSwapCubit: getIt<PendingAtomicSwapCubit>(),
        poscanAssetsCubit: getIt<PoscanAssetsCubit>(),
        poolsCubit: getIt<PoolsCubit>(),
      ),
    );

    getIt.registerFactoryParam<ClaimPoscanAtomicSwapCubit,
        PendingPoscanAtomicSwap, StackRouter>(
      (final PendingPoscanAtomicSwap p1, final StackRouter p2) =>
          ClaimPoscanAtomicSwapCubit(
        pendingSwap: p1,
        outerRouter: p2,
        accountToSignExtrinsic:
            getIt<CurrentAccountCubit>().state.value!.nativeP3D,
        claimPoscanAtomicSwap: getIt<ClaimPoscanAtomicSwap>(),
      ),
    );
    getIt.registerFactory<GetPendingPoscanAtomicSwap>(
      () => GetPendingPoscanAtomicSwap(
        poscanAtomicSwapRepository: getIt<PoscanAtomicSwapRepository>(),
        encodeAddress: getIt<EncodeAddress>(),
      ),
    );
    getIt.registerLazySingleton<PendingAtomicSwapCubit>(
      () => PendingAtomicSwapCubit(
        getPendingPoscanAtomicSwap: getIt<GetPendingPoscanAtomicSwap>(),
      ),
    );
  }
}
