import 'package:get_it/get_it.dart';

import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/features/chains/domain/usecases/get_ss58.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/remote_objects_count_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/user_objects_list_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/clear_local_cache.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/find_objects_by_hash.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_local_obj_count_usecase.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_object_content.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_owned_objects_ids.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_user_objects_meta.dart';

class DIPoscanQuery extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<PoScanRemoteRepository>(
      () => PoScanRemoteRepository(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      ),
    );
    getIt.registerFactoryParam<PoScanLocalRepository, int, void>(
      (final int p0, final void p1) => PoScanLocalRepositoryImpl(
        db: getIt<CacheDatabase>(),
        ss58: p0,
      ),
    );

    getIt.registerFactory<GetLocalObjCount>(
      () => GetLocalObjCount(
        repository: getIt<PoScanRemoteRepository>(),
      ),
    );
    getIt.registerFactory<GetObjectContent>(
      () => GetObjectContent(
        remote: getIt<PoScanRemoteRepository>(),
        local: getIt<PoScanLocalRepository>(
          param1: getIt<GetSS58>()(null),
        ),
      ),
    );
    getIt.registerFactory<GetUserObjectsMeta>(
      () => GetUserObjectsMeta(
        ownedObjectsIds: getIt<GetOwnedObjectsIds>(),
        uploadedObject: getIt<GetUploadedObject>(),
      ),
    );
    getIt.registerFactory<ClearLocalCache>(
      () => ClearLocalCache(
        repo: getIt<PoScanLocalRepository>(
          param1: getIt<GetSS58>()(null),
        ),
      ),
    );
    getIt.registerFactory<FindObjectsByHash>(
      () => FindObjectsByHash(
        localRepo: getIt<PoScanLocalRepository>(
          param1: getIt<GetSS58>()(null),
        ),
      ),
    );
    getIt.registerFactory<GetUploadedObject>(
      () => GetUploadedObject(
        remote: getIt<PoScanRemoteRepository>(),
        local: getIt<PoScanLocalRepository>(
          param1: getIt<GetSS58>()(null),
        ),
      ),
    );
    getIt.registerFactory<GetOwnedObjectsIds>(
      () => GetOwnedObjectsIds(
        repository: getIt<PoScanRemoteRepository>(),
      ),
    );

    getIt.registerLazySingleton<RemoteObjectsCountCubit>(
      () => RemoteObjectsCountCubit(),
    );

    getIt.registerLazySingleton<UserObjectsListCubit>(
      () => UserObjectsListCubit(
        currentAccountCubit: getIt<CurrentAccountCubit>(),
      ),
    );
  }
}
