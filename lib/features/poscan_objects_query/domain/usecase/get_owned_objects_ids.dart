import 'package:super_core/super_core.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';

class GetOwnedObjectsIds extends UseCase<List<int>, String> {
  final PoScanRemoteRepository repository;

  const GetOwnedObjectsIds({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<int>>> call(
    final String accountId,
  ) async =>
      repository.owners(accountId);
}
