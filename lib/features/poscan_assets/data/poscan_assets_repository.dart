import 'package:super_core/super_core.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

abstract class PoscanAssetsRepository {
  const PoscanAssetsRepository();

  Future<Either<Failure, void>> create();
  Future<Either<Failure, void>> setMetadata();
  Future<Either<Failure, void>> mint();
  Future<Either<Failure, void>> transfer();
  Future<Either<Failure, List<PoscanTokenData>>> allTokens();
}

class PoscanAssetsRepositoryImpl implements PoscanAssetsRepository {
  const PoscanAssetsRepositoryImpl();

  @override
  Future<Either<Failure, void>> create() async {
    return const Either.right(null);
  }

  @override
  Future<Either<Failure, void>> setMetadata() async {
    return const Either.right(null);
  }

  @override
  Future<Either<Failure, void>> mint() async {
    return const Either.right(null);
  }

  @override
  Future<Either<Failure, void>> transfer() async {
    return const Either.right(null);
  }

  @override
  Future<Either<Failure, List<PoscanTokenData>>> allTokens() async {
    //   final dynamic lol = await service.plugin.sdk.api.universal.callNoSign(
    //   calls: ['query', 'poscanAssets', 'metadata', 'entries'],
    //   args: null,
    // );
    return const Either.right(
      [
        PoscanTokenData(
          assetId: 1,
          fullName: 'Some long long long long long long long long long name',
          symbols: 'SML',
        ),
        PoscanTokenData(
          assetId: 42,
          fullName: 'Some',
          symbols: 'SM',
        ),
        PoscanTokenData(
          assetId: 228,
          fullName: 'Yeah boy',
          symbols: 'LOL',
        ),
      ],
    );
  }
}
