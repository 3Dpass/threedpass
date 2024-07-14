import 'package:super_core/super_core.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class GetUploadedObject extends UseCase<UploadedObject, int> {
  final PoScanRemoteRepository remote;
  final PoScanLocalRepository local;

  const GetUploadedObject({
    required this.remote,
    required this.local,
  });

  @override
  Future<Either<Failure, UploadedObject>> call(
    final int id,
  ) async {
    final localRes = await local.get(id);

    if (localRes == null || !localRes.isFinished) {
      final remoteResponse = await remote.objects(id);
      return remoteResponse.when(
        left: (final e) => Either.left(e),
        right: (final remoteObj) async {
          await local.put(remoteObj);
          return Either.right(remoteObj);
        },
      );
    } else {
      return Either.right(localRes);
    }
  }
}
