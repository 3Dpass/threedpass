import 'package:super_core/super_core.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';

class GetObjCount extends UseCase<int, void> {
  final PoScanRemoteRepository repository;

  const GetObjCount({
    required this.repository,
  });

  @override
  Future<Either<Failure, int>> call(
    final void params,
  ) async =>
      repository.objCount();
}
