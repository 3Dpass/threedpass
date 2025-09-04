import 'package:get_it/get_it.dart';

import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/app/data/cache_database.dart';
import 'package:threedpass/features/chains/domain/usecases/get_ss58.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/remote_objects_count_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/clear_local_cache.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/find_objects_by_hash.dart';
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
    getIt.registerFactoryParam<PoScanLocalRepository, int, void>(
      (final int p0, final void p1) => PoScanLocalRepositoryImpl(
        db: getIt<CacheDatabase>(),
        ss58: p0,
      ),
    );

    getIt.registerFactory<GetObjCount>(
      () => GetObjCount(
        repository: getIt<PoScanRemoteRepository>(),
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

    getIt.registerLazySingleton<PoscanObjectsCubit>(
      () => PoscanObjectsCubit(
        hashesListBloc: getIt<HashesListBloc>(),
      ),
    );
  }
}
