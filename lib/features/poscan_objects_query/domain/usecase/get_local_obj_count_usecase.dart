import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';

class GetLocalObjCount extends UseCase<int, void> {
  final PoScanRemoteRepository repository;

  const GetLocalObjCount({
    required this.repository,
  });

  @override
  Future<int> call(final void params) => repository.objCount();
}
