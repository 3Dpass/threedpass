import 'package:threedpass/core/persistence/basic_get_data_use_case.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class GetUploadedObject extends BasicGetDataUseCase<UploadedObject, int,
    UploadedObject, (UploadedObject, ObjectContent)> {
  final PoScanRemoteRepository remote;
  final PoScanLocalRepository local;

  const GetUploadedObject({
    required this.remote,
    required this.local,
  });

  @override
  Future<UploadedObject> fallback(int params) {
    throw Exception('Object not found');
  }

  @override
  Future<UploadedObject?> getCache(int id) => local.getMeta(id);

  @override
  Future<(UploadedObject, ObjectContent)> getRemote(int id) =>
      remote.object(id);

  @override
  UploadedObject mapCacheData(UploadedObject cacheData, int params) =>
      cacheData;

  @override
  UploadedObject mapRemoteData(
      (UploadedObject, ObjectContent) remoteData, int params) {
    final (meta, content) = remoteData;
    return meta;
  }

  @override
  Future<UploadedObject?> storeRemote(
    (UploadedObject, ObjectContent) remoteData,
    int _,
  ) {
    final (meta, content) = remoteData;
    if (meta.isFinished) {
      local.put(meta, content);
    }
    return Future.value(null);
  }
}
