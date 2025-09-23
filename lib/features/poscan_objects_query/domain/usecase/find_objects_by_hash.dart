import 'package:threedpass/core/persistence/basic_get_data_use_case.dart';
import 'package:threedpass/features/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/features/poscan_objects_query/data/poscan_local_repository.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class FindObjectsByHash extends BasicGetDataUseCase<List<UploadedObject>,
    List<HexEx>, List<UploadedObject>, List<UploadedObject>> {
  final PoScanLocalRepository localRepo;

  const FindObjectsByHash({
    required this.localRepo,
  });

  @override
  Future<List<UploadedObject>> fallback(List<HexEx> params) => Future.value([]);

  @override
  Future<List<UploadedObject>?> getCache(List<HexEx> params) =>
      localRepo.containAnyHash(params);

  @override
  Future<List<UploadedObject>> getRemote(List<HexEx> params) {
    // TODO: implement getRemote
    return Future.value([]);
  }

  @override
  List<UploadedObject> mapCacheData(
    List<UploadedObject> cacheData,
    List<HexEx> params,
  ) =>
      cacheData;

  @override
  Future<List<UploadedObject>> storeRemote(
    List<UploadedObject> remoteData,
    List<HexEx> params,
  ) {
    // remoteData.forEach((final object) => localRepo.put(object)); // TODO batch // Implement when getRemote is ready
    return Future.value(remoteData);
  }
}
