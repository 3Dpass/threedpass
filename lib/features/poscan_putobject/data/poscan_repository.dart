import 'dart:io';

import 'package:polkawallet_sdk/p3d/prop_value.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

class PoScanRepository {
  const PoScanRepository({
    required this.appServiceLoaderCubit,
  });

  final AppServiceLoaderCubit appServiceLoaderCubit;

  Future<Either<Failure, void>> putObject({
    required final KeyPairData account,
    required final String password,
    required final int nApprovals,
    required final String pathToFile,
    required final MapPoscanCategory categoryFabric,
    required final List<String>? hashes,
    required final List<PropValue>? propValues,
  }) async {
    final poscanApi = appServiceLoaderCubit.state.plugin.sdk.api.poscan;

    try {
      final file = File(pathToFile);
      final bytes = file.readAsBytesSync();

      final res = poscanApi.putObject(
        pubKey: account.pubKey!,
        password: password,
        onStatusChange: (String p0) {
          print(p0);
        },
        category: categoryFabric.build(),
        file: bytes,
        nApprovals: nApprovals,
        hashes: hashes,
        propValue: propValues,
      );
      print('RES=');
      print(res);
      return const Either.right(null);
    } on Object catch (e) {
      return Either.left(NoDataFailure(e.toString()));
    }
  }
}

enum D3pRPCError { a, b }
