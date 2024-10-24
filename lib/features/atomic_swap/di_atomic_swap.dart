import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/atomic_swap/ui/create/bloc/create_swap_cubit.dart';

class DiAtomicSwap extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerFactoryParam<CreateAtomicSwapCubit, int, StackRouter>(
      (final initialAssetId, final router) => CreateAtomicSwapCubit(
        // initialAsset: initialAssetId,
        // appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        // mintAsset: getIt<MintAsset>(),
        outerRouter: router,
      ),
    );
  }
}
