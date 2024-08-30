import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_putobject/data/poscan_putobject_repository.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class DIPreviewPage extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<PoScanPutObjectRepository>(
      () => PoScanPutObjectRepository(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      ),
    );

    getIt.registerLazySingleton<PutObject>(
      () => PutObject(
        repository: getIt<PoScanPutObjectRepository>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      ),
    );
  }
}
