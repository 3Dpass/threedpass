import 'package:threedpass/core/persistence/basic_get_data_use_case.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class FindObjectsByHash extends BasicGetDataUseCase<List<UploadedObject>,
    List<String>, List<UploadedObject>, List<UploadedObject>> {
  final PoScanLocalRepository localRepo;

  const FindObjectsByHash({
    required this.localRepo,
  });

  @override
  Future<List<UploadedObject>> fallback(List<String> params) =>
      Future.value([]);

  @override
  Future<List<UploadedObject>?> getCache(List<String> params) =>
      localRepo.containAnyHash(params);

  @override
  Future<List<UploadedObject>> getRemote(List<String> params) {
    // TODO: implement getRemote
    return Future.value([]);
  }

  @override
  List<UploadedObject> mapCacheData(
    List<UploadedObject> cacheData,
    List<String> params,
  ) =>
      cacheData;

  @override
  List<UploadedObject> mapRemoteData(
          List<UploadedObject> remoteData, List<String> params) =>
      remoteData;

  @override
  Future<List<UploadedObject>?> storeRemote(
    List<UploadedObject> remoteData,
    List<String> params,
  ) {
    // remoteData.forEach((final object) => localRepo.put(object)); // TODO batch
    return Future.value(null);
  }
}
