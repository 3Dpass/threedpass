import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/atomic_swap/common/data/atomic_swap_repository.dart';
import 'package:threedpass/features/atomic_swap/create/bloc/create_atomic_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/create/domain/usecases/calc_hashed_proof.dart';
import 'package:threedpass/features/atomic_swap/create/domain/usecases/create_atomic_swap.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class DiAtomicSwap extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<AtomicSwapRepository>(
      () => AtomicSwapRepositoryImpl(
        callSignExtrinsicUtil: getIt<CallSignExtrinsicUtil>(),
      ),
    );

    getIt.registerFactory<CalcHashedProof>(() => CalcHashedProof());
    getIt.registerFactory<CreateAtomicSwap>(
      () => CreateAtomicSwap(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        atomicSwapRepository: getIt<AtomicSwapRepository>(),
      ),
    );

    getIt.registerFactoryParam<CreateAtomicSwapCubit, int, StackRouter>(
      (final initialAssetId, final router) => CreateAtomicSwapCubit(
        // initialAsset: initialAssetId,
        // appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        // mintAsset: getIt<MintAsset>(),
        outerRouter: router,
        calcHashedProof: getIt<CalcHashedProof>(),
        createAtomicSwap: getIt<CreateAtomicSwap>(),
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      ),
    );
  }
}
