import 'package:threedpass/core/persistence/cache_remote_usecase_routine.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/data/tokens_asset_data_inmem_cache.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class GetAllTokensData extends UseCase<List<PoscanAssetData>, void> {
  final PoscanAssetsRepository poscanAssetsRepo;
  final TokensAssetDataInMemCache tokensAssetDataInMemCache;

  const GetAllTokensData({
    required this.poscanAssetsRepo,
    required this.tokensAssetDataInMemCache,
  });

  @override
  Future<List<PoscanAssetData>> call(
    final void params,
  ) async =>
      cacheSingletonRemoteUsecaseRoutine<List<PoscanAssetData>>(
        getRemote: poscanAssetsRepo.allTokens,
        cache: tokensAssetDataInMemCache,
      );
}
