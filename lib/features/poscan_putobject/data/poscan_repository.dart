import 'dart:convert';
import 'dart:io';

import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';

class PoScanRepository {
  const PoScanRepository({
    required this.appServiceLoaderCubit,
  });

  final AppServiceLoaderCubit appServiceLoaderCubit;

  String encodePropValues(final List<PropValue>? propValues) {
    if (propValues == null) return 'null';
    if (propValues.isEmpty) return 'null';

    final crutchEncodedStruct = propValues
        .map(
          (final e) => {
            'propIdx': e.propIdx,
            'maxValue': BigIntJsonHelper.encode(e.maxValue),
          },
        )
        .toList();

    final argsPreEncoded = const JsonEncoder().convert(crutchEncodedStruct);
    final argsEncoded = BigIntJsonHelper.replace(argsPreEncoded);

    logger.t(argsEncoded);
    return argsEncoded;
  }

  Future<Either<Failure, String>> putObject({
    required final PutObjectParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final poscanApi = appServiceLoaderCubit.state.plugin.sdk.api.poscan;

    try {
      final file = File(params.pathToFile);
      final bytes = file.readAsStringSync();
      final jbytes = jsonEncode(bytes);

      bool flag = true;

      // final basicEncoding = const JsonEncoder().convert(params.propValues);

      final argPropValue = encodePropValues(params.propValues);

      logger.t(params.categoryFabric.build());
      logger.t(argPropValue);

      final dynamic res = await poscanApi.putObject(
        pubKey: params.account.pubKey!,
        password: params.password,
        category: params.categoryFabric.build(),
        file: jbytes,
        nApprovals: params.nApprovals,
        hashes: params.hashes,
        propValue: argPropValue,
        onStatusChange: (final p0) {
          // print('$p0');
          if (flag) {
            updateStatus();
            flag = false;
          }
        },
        msgIdCallback: msgIdCallback,
      );
      logger.d(res);
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
      logger.e(e);
      return Either.left(NoDataFailure(e.toString()));
    }
  }
}

enum D3pRPCError { a, b }
