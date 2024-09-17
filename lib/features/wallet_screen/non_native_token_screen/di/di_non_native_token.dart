import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/graphql/events/data/repositories/events_datasource_local.dart';
import 'package:threedpass/features/graphql/events/data/repositories/events_datasource_remote.dart';
import 'package:threedpass/features/graphql/extrinsics/data/repositories/extrinsic_datasource.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/data/repositories/assets_extrinsics_repository.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/data/repositories/events_repository.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/usecases/assets_get_extrinsics.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/usecases/get_events_usecase.dart';

class DINonNativeToken extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    // Repos
    getIt.registerLazySingleton<AssetsExtrinsicsRepository>(
      () => AssetsExtrinsicsRepository(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        client: getIt<Client>(),
        extrinsicsDatasourceGQL: getIt<ExtrinsicDatasourceGQL>(),
      ),
    );
    getIt.registerLazySingleton<EventsRepository>(
      () => EventsRepository(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        client: getIt<Client>(),
        eventsDatasourceGQL: getIt<EventsDatasourceGQL>(),
        eventsDatasourceLocal: getIt<EventsDatasourceLocal>(),
      ),
    );

    // UseCases
    getIt.registerFactoryParam<AssetsGetExtrinsics, AssetsExtrinsicsRepository,
        GetExtrinsicsUseCaseParams>(
      (final param1, final param2) => AssetsGetExtrinsics(
        repository: param1,
        paramsUseCase: param2,
      ),
    );

    getIt.registerFactoryParam<GetEventsUseCase, EventsRepository, void>(
      (final param1, final param2) => GetEventsUseCase(
        repository: param1,
      ),
    );

    // BLoC
    getIt.registerFactoryParam<AssetsGetExtrinsicsCubit, AssetsGetExtrinsics,
        GetEventsUseCase>(
      (final param1, final param2) => AssetsGetExtrinsicsCubit(
        getExtrinsics: param1,
        getEvents: param2,
      ),
    );
  }
}
