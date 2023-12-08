import 'dart:io';

import 'package:polkawallet_sdk/p3d/prop_value.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_categories.dart';

class PoScanRepository {
  const PoScanRepository({
    required this.appServiceLoaderCubit,
  });

  final AppServiceLoaderCubit appServiceLoaderCubit;

  Future<Either<Failure, String>> putObject({
    required final KeyPairData account,
    required final String password,
    required final int nApprovals,
    required final String pathToFile,
    required final MapPoscanCategory categoryFabric,
    required final List<String> hashes,
    required final List<PropValue>? propValues,
    required final void Function() updateStatus,
  }) async {
    final poscanApi = appServiceLoaderCubit.state.plugin.sdk.api.poscan;

    try {
      final file = File(pathToFile);
      final bytes = file.readAsBytesSync();

      bool flag = true;

      final dynamic res = await poscanApi.putObject(
        pubKey: account.pubKey!,
        password: password,
        category: categoryFabric.build(),
        file: bytes,
        nApprovals: nApprovals,
        hashes: hashes,
        propValue: propValues,
        onStatusChange: (final p0) {
          print('$p0');
          if (flag) {
            updateStatus();
            flag = false;
          }
          // return a;
        },
      );
      print('RES=');
      print(res);
      if (res is Map) {
        final String key = res.keys.first as String;
        if (key == 'error') {
          return Either.left(NoDataFailure(res[key].toString()));
        } else {
          return Either.right(res.values.join(''));
        }
      } else {
        return const Either.left(NoDataFailure('res is not a Map'));
      }
    } on Object catch (e) {
      print(e);
      return Either.left(NoDataFailure(e.toString()));
    }
  }
}

enum D3pRPCError { a, b }
