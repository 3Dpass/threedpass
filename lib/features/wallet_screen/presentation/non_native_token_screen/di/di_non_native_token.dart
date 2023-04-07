import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/tokens_events_history/data/repositories/extrinsic_datasource.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/data/repositories/assets_extrinsics_repository.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/usecases/assets_get_extrinsics.dart';

class DINonNativeToken extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerSingleton<AssetsExtrinsicsRepository>(
      AssetsExtrinsicsRepository(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        client: getIt<Client>(),
        extrinsicsDatasourceGQL: getIt<ExtrinsicDatasourceGQL>(),
      ),
    );

    getIt.registerFactoryParam<AssetsGetExtrinsics, AssetsExtrinsicsRepository,
        GetExtrinsicsUseCaseParams>(
      (final param1, final param2) => AssetsGetExtrinsics(
        repository: param1,
        params: param2,
      ),
    );

    getIt.registerFactoryParam<AssetsGetExtrinsicsCubit, AssetsGetExtrinsics,
        void>(
      (final param1, final param2) => AssetsGetExtrinsicsCubit(
        getExtrinsics: param1,
      ),
    );
  }
}
