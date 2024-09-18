import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';

class GetObjCount extends UseCase<int, void> {
  final PoScanRemoteRepository repository;

  const GetObjCount({
    required this.repository,
  });

  @override
  Future<int> call(
    final void params,
  ) =>
      repository.objCount();
}
