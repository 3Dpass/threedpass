import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/rest/bloc/explorer_url_cubit.dart';
import 'package:threedpass/features/rest/data/repositories/public_explorer_list_repository.dart';
import 'package:threedpass/features/rest/domain/usecases/resolve_explorer_url.dart';
import 'package:threedpass/features/rest/explorer_rest.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';

class DIRest extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<PublicExplorerListRepository>(
      () => PublicExplorerListRepositoryImpl(dio: getIt<Dio>()),
    );

    getIt.registerFactory<ResolveExplorerUrl>(
      () => ResolveExplorerUrl(
        publicExplorersRepo: getIt<PublicExplorerListRepository>(),
        settingsRepo: getIt<SettingsRepository>(),
      ),
    );

    getIt.registerLazySingleton<ExplorerUrlCubit>(
      () => ExplorerUrlCubit(
        resolveExplorerUrl: getIt<ResolveExplorerUrl>(),
      ),
    );

    getIt.registerFactory<ExplorerRest>(
      () => ExplorerRest(
        getIt<Dio>(),
        baseUrl:
            getIt<ExplorerUrlCubit>().state.valueOrNull ?? kDefaultExplorerUrl,
      ),
    );
  }
}
