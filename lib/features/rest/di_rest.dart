import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/rest/rest_client.dart';

class DIRest extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<RestClient>(
      () => RestClient(getIt<Dio>()),
    );
  }
}
