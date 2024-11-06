import 'package:get_it/get_it.dart';

import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/poscan_objects_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_obj_count_usecase.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_owned_objects_ids.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';

class DIPoscanQuery extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<PoScanRemoteRepository>(
      () => PoScanRemoteRepository(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      ),
    );
    getIt.registerLazySingleton<PoScanLocalRepository>(
      () => PoScanLocalRepository(),
    );

    getIt.registerLazySingleton<GetObjCount>(
      () => GetObjCount(
        repository: getIt<PoScanRemoteRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetUploadedObject>(
      () => GetUploadedObject(
        remote: getIt<PoScanRemoteRepository>(),
        local: getIt<PoScanLocalRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetOwnedObjectsIds>(
      () => GetOwnedObjectsIds(
        repository: getIt<PoScanRemoteRepository>(),
      ),
    );

    getIt.registerLazySingleton<PoscanObjectsCubit>(
      () => PoscanObjectsCubit(
        getObjCount: getIt<GetObjCount>(),
        getUploadedObject: getIt<GetUploadedObject>(),
        getOwnedObjectsIds: getIt<GetOwnedObjectsIds>(),
        store: getIt<PoScanLocalRepository>(),
        hashesListBloc: getIt<HashesListBloc>(),
      ),
    );
  }
}
