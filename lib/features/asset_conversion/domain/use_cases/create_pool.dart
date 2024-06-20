import 'package:super_core/super_core.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';

class CreatePool extends UseCase<void, CreatePoolParams> {
  final AssetConversionRepository assetConversionRepository;
  // final PoscanAssetsRepository poscanAssetsRepo;

  const CreatePool({
    required this.assetConversionRepository,
    // required this.poscanAssetsRepo,
  });

  @override
  Future<Either<Failure, void>> call(
    final CreatePoolParams params,
  ) async {
    return Either.right(null);
  }
}

class CreatePoolParams {}
