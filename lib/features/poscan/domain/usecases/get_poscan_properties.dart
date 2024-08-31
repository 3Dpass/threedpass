import 'package:super_core/super_core.dart';
import 'package:threedpass/features/poscan_putobject/data/poscan_putobject_repository.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';

class GetPoscanProperties extends UseCase<List<PoscanProperty>, void> {
  final PoScanPutObjectRepository
      repository; // TODO Add local repo and cache remote results

  const GetPoscanProperties({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<PoscanProperty>>> call(
    final void params,
  ) =>
      repository.properties();
}
