import 'package:super_core/super_core.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class GetAllTokensData extends UseCase<List<PoscanAssetData>, void> {
  final PoscanAssetsRepository poscanAssetsRepo;

  const GetAllTokensData({
    required this.poscanAssetsRepo,
  });

  @override
  Future<Either<Failure, List<PoscanAssetData>>> call(
    final void params,
  ) async =>
      poscanAssetsRepo.allTokens(); // TODO Add local cache
}
