import 'package:threedpass/core/persistence/cache_remote_usecase_routine.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/data/tokens_metadata_inmem_cache.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

class GetAllTokensMetadata extends UseCase<PoscanAssetMetadataMap, void> {
  final PoscanAssetsRepository poscanAssetsRepo;
  final TokensMetadataInMemCache tokensMetadataInMemCache;

  const GetAllTokensMetadata({
    required this.poscanAssetsRepo,
    required this.tokensMetadataInMemCache,
  });

  @override
  Future<PoscanAssetMetadataMap> call(final void params) async =>
      cacheSingletonRemoteUsecaseRoutine<PoscanAssetMetadataMap>(
        getRemote: poscanAssetsRepo.tokensMetadata,
        cache: tokensMetadataInMemCache,
      );
}
