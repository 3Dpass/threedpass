import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/usecase.dart';
import 'package:threedpass/features/poscan_objects_query/data/storage_poscan_repo.dart';

class GetObjCount extends UseCase<int, void> {
  final StoragePoscanRepository repository;

  const GetObjCount({
    required this.repository,
  });

  @override
  Future<Either<Failure, int>> call(
    final void params,
  ) async {
    final res = await repository.objCount();
    return res;
  }
}
