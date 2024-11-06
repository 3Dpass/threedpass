import 'package:get_it/get_it.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/scan_page/bloc/objects_expanded_cubit.dart';
import 'package:threedpass/features/scan_page/bloc/select_snapshots_cubit.dart';

class DIScanPage extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<SelectSnapshotsCubit>(
      () => SelectSnapshotsCubit(),
    );

    getIt.registerLazySingleton<ObjectsExpandedCubit>(
      () => ObjectsExpandedCubit(),
    );
  }
}
