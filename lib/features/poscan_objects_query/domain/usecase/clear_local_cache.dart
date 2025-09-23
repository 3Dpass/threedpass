import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';

class ClearLocalCache extends UseCase<void, void> {
  final PoScanLocalRepository repo;

  const ClearLocalCache({
    required this.repo,
  });

  @override
  Future<void> call(final void params) => repo.clear();
}
