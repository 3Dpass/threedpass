import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

class GetAllTokensMetadata
    extends UseCase<Map<int, PoscanAssetMetadata>, void> {
  final PoscanAssetsRepository poscanAssetsRepo;

  const GetAllTokensMetadata({
    required this.poscanAssetsRepo,
  });

  @override
  Future<Map<int, PoscanAssetMetadata>> call(
    final void params,
  ) async =>
      poscanAssetsRepo.tokensMetadata();
}
