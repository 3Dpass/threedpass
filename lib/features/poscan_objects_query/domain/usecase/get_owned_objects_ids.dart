import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';

class GetOwnedObjectsIds extends UseCase<List<int>, String> {
  final PoScanRemoteRepository repository;

  const GetOwnedObjectsIds({
    required this.repository,
  });

  @override
  Future<List<int>> call(
    final String accountId,
  ) =>
      repository.owners(accountId);
}
