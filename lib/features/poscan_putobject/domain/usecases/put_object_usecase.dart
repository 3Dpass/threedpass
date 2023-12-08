import 'package:polkawallet_sdk/p3d/prop_value.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/usecase.dart';
import 'package:threedpass/features/poscan_putobject/data/poscan_repository.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';

class PutObject extends UseCase<void, PutObjectParams> {
  final PoScanRepository repository;

  const PutObject({required this.repository});

  @override
  Future<Either<Failure, void>> call(
    final PutObjectParams params,
  ) async {
    return repository.putObject(
      account: params.account,
      password: params.password,
      nApprovals: params.nApprovals,
      pathToFile: params.pathToFile,
      categoryFabric: params.categoryFabric,
      hashes: params.hashes,
      propValues: params.propValues,
      updateStatus: params.updateStatus,
    );
  }
}

class PutObjectParams {
  const PutObjectParams({
    required this.account,
    required this.password,
    required this.nApprovals,
    required this.pathToFile,
    required this.categoryFabric,
    required this.hashes,
    required this.propValues,
    required this.updateStatus,
  });

  final KeyPairData account;
  final String password;
  final int nApprovals;
  final String pathToFile;
  final MapPoscanCategory categoryFabric;
  final List<String> hashes;
  final List<PropValue>? propValues;
  final void Function() updateStatus;
}
