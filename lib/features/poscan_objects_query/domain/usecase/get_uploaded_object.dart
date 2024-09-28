import 'package:threedpass/core/usecase.dart';
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
  Future<UploadedObject> call(
    final int id,
  ) async {
    final localRes = await local.get(id);

    if (localRes == null || !localRes.isFinished) {
      final remoteObj = await remote.objects(id);
      await local.put(remoteObj);
      return remoteObj;
    } else {
      return localRes;
    }
  }
}
