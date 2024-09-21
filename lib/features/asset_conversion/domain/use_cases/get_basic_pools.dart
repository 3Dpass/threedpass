import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';

class GetBasicPools extends UseCase<List<BasicPoolEntity>, void> {
  final AssetConversionRepository assetConversionRepository;

  const GetBasicPools({
    required this.assetConversionRepository,
  });

  @override
  Future<List<BasicPoolEntity>> call(
    final void _,
  ) =>
      assetConversionRepository.poolsBasic();
}
