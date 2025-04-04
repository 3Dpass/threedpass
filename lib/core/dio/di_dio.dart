import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:threedpass/core/dio/dio_observer.dart';
import 'package:threedpass/core/utils/di_module.dart';

class DIDio extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerSingleton<Dio>(Dio());

    getIt<Dio>().interceptors.add(DioObserver());
  }
}
