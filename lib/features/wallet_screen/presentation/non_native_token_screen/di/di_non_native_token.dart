import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/tokens_events_history/data/repositories/extrinsic_datasource.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/data/repositories/extrinsics_repository.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/usecases/get_extrinsics.dart';

class DINonNativeToken extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerSingleton<ExtrinsicsRepository>(
      ExtrinsicsRepository(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        client: getIt<Client>(),
        extrinsicsDatasourceGQL: getIt<ExtrinsicDatasourceGQL>(),
      ),
    );

    getIt.registerFactoryParam<GetExtrinsics, ExtrinsicsRepository,
        GetExtrinsicsUseCaseParams>(
      (final param1, final param2) => GetExtrinsics(
        repository: param1,
        params: param2,
      ),
    );

    getIt.registerFactoryParam<GetExtrinsicsCubit, GetExtrinsics, void>(
      (final param1, final param2) => GetExtrinsicsCubit(
        getExtrinsics: param1,
      ),
    );
  }
}
