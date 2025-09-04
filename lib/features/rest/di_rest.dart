import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/rest/explorer_rest.dart';

class DIRest extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<ExplorerRest>(
      () => ExplorerRest(getIt<Dio>()),
    );
  }
}
