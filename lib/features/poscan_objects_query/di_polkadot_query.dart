import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/data/storage_poscan_repo.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_obj_count_usecase.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';

class DIPoscanQuery extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerSingleton<StoragePoscanRepository>(
      StoragePoscanRepository(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      ),
    );

    getIt.registerSingleton<GetObjCount>(
      GetObjCount(
        repository: getIt<StoragePoscanRepository>(),
      ),
    );

    getIt.registerSingleton<GetUploadedObject>(
      GetUploadedObject(
        repository: getIt<StoragePoscanRepository>(),
      ),
    );

    getIt.registerSingleton<PoscanObjectsCubit>(
      PoscanObjectsCubit(
        getObjCount: getIt<GetObjCount>(),
        getUploadedObject: getIt<GetUploadedObject>(),
      ),
    );
  }
}
