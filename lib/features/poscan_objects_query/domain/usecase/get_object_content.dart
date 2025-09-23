import 'package:threedpass/core/persistence/basic_get_data_use_case.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_remote_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class GetObjectContent extends BasicGetDataUseCase<ObjectContent, int,
    ObjectContent, (UploadedObject, ObjectContent)> {
  final PoScanRemoteRepository remote;
  final PoScanLocalRepository local;

  const GetObjectContent({
    required this.remote,
    required this.local,
  });

  @override
  Future<ObjectContent> fallback(int params) {
    throw Exception('Object not found');
  }

  @override
  Future<ObjectContent?> getCache(int id) => local.getData(id);

  @override
  Future<(UploadedObject, ObjectContent)> getRemote(int id) =>
      remote.object(id);

  @override
  ObjectContent mapCacheData(ObjectContent cacheData, int params) => cacheData;

  @override
  Future<ObjectContent> storeRemote(
    (UploadedObject, ObjectContent) remoteData,
    int _,
  ) {
    final (meta, content) = remoteData;
    if (meta.isFinished) {
      local.put(meta, content);
    }
    return Future.value(content);
  }
}
