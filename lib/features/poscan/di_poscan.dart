import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/poscan/bloc/get_poscan_properties_cubit.dart';
import 'package:threedpass/features/poscan/domain/usecases/get_poscan_properties.dart';
import 'package:threedpass/features/poscan_putobject/data/poscan_putobject_repository.dart';

class DIPoscan extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerFactory<GetPoscanProperties>(
      () => GetPoscanProperties(
        repository: getIt<PoScanPutObjectRepository>(),
      ),
    );
    getIt.registerFactory<GetPoscanPropertiesCubit>(
      () => GetPoscanPropertiesCubit(
        useCase: getIt<GetPoscanProperties>(),
      ),
    );
  }
}
