import 'package:super_core/super_core.dart';

abstract class PoscanAssetsRepository {
  const PoscanAssetsRepository();

  Future<Either<Failure, void>> create();
  Future<Either<Failure, void>> setMetadata();
  Future<Either<Failure, void>> mint();
  Future<Either<Failure, void>> transfer();
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
}
