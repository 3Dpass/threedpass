import 'package:dio/dio.dart';
import 'package:threedpass/core/usecase.dart';

abstract class BasicGetDataUseCase<TRes, TParam, TCacheData, TRemoteData>
    extends UseCase<TRes, TParam> {
  Future<TCacheData?> getCache(TParam params);
  Future<TRemoteData> getRemote(TParam params);
  Future<TCacheData?> storeRemote(TRemoteData remoteData, TParam params);
  TRes mapCacheData(TCacheData cacheData, TParam params);
  TRes mapRemoteData(TRemoteData remoteData, TParam params);
  Future<TRes> fallback(TParam params);

  const BasicGetDataUseCase();

  @override
  Future<TRes> call(TParam params) async {
    final cache = await getCache(params);

    if (cache != null) {
      return mapCacheData(cache, params);
    } else {
      try {
        final remoteData = await getRemote(params);
        final savedCache = await storeRemote(remoteData, params);
        if (savedCache != null) {
          return mapCacheData(savedCache, params);
        } else {
          return mapRemoteData(remoteData, params);
        }
      } on DioException catch (_) {
        return fallback(params);
      }
    }
  }
}
