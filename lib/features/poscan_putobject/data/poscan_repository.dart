import 'dart:io';

import 'package:logger/logger.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';
import 'package:threedpass/setup.dart';

class PoScanRepository {
  const PoScanRepository({
    required this.appServiceLoaderCubit,
  });

  final AppServiceLoaderCubit appServiceLoaderCubit;

  Future<Either<Failure, String>> putObject({
    required final PutObjectParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final poscanApi = appServiceLoaderCubit.state.plugin.sdk.api.poscan;

    try {
      final file = File(params.pathToFile);
      final bytes = file.readAsBytesSync();
      // print(params.pathToFile);
      // print(file.readAsBytesSync());
      // print(file.readAsBytesSync().length);
      // print('0x${bytes.toList().map((e) => e.toRadixString(16)).join('')}');

      // return const Either.left(NoDataFailure('res is not a Map'));

      bool flag = true;

      final dynamic res = await poscanApi.putObject(
        pubKey: params.account.pubKey!,
        password: params.password,
        category: params.categoryFabric.build(),
        file: bytes,
        nApprovals: params.nApprovals,
        hashes: params.hashes,
        propValue: params.propValues,
        onStatusChange: (final p0) {
          // print('$p0');
          if (flag) {
            updateStatus();
            flag = false;
          }
        },
        msgIdCallback: msgIdCallback,
      );
      getIt<Logger>().d(res);
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
      getIt<Logger>().e(e);
      return Either.left(NoDataFailure(e.toString()));
    }
  }
}

enum D3pRPCError { a, b }
