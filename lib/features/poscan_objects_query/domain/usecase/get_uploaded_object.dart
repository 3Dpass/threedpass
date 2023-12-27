import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/usecase.dart';
import 'package:threedpass/features/poscan_objects_query/data/storage_poscan_repo.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class GetUploadedObject extends UseCase<UploadedObject, int> {
  final StoragePoscanRepository repository;

  const GetUploadedObject({
    required this.repository,
  });

  @override
  Future<Either<Failure, UploadedObject>> call(
    final int id,
  ) async {
    final res = await repository.objects(id);

    return res.when(
      left: (final e) => Either.left(e),
      right: (final obj) => Either.right(obj),
    );
  }
}
