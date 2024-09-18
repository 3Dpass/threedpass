import 'dart:convert';
import 'dart:io';

import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/basic_polkadot_js_call.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';

class PoScanPutObjectRepository {
  const PoScanPutObjectRepository({
    required this.appServiceLoaderCubit,
  });

  final AppServiceLoaderCubit appServiceLoaderCubit;

  Future<List<PoscanProperty>> properties() async {
    const String getPropsFunc = """
var p = async () => {
  const props = await api.query.poScan.properties.entries();
    return props.map(([key, value]) => [key.args?.[0].toHuman(), value.toHuman()]);
};
var res = await p();
return res;
""";

    final dynamic res = await basicJSCall(
      getPropsFunc,
      appServiceLoaderCubit
          .state.plugin.sdk.webView!.webInstance!.webViewController,
    );
    // [ "1", {name: 'Share', class: 'Relative', maxValue: '100,000,000'}]
    logger.t('properties res: $res');

    res as List<dynamic>;
    final resT = res.map<PoscanProperty>(
      (final dynamic e) {
        final rawList = e as List<dynamic>;
        final data = rawList[1] as Map<String, dynamic>;
        final id = int.parse(rawList.first as String);

        return PoscanProperty(
          name: data['name'] as String,
          poscanPropertyType: PoscanPropertyType.values.firstWhere(
            (final e) =>
                e.name.toLowerCase() == data['class'].toString().toLowerCase(),
            orElse: () => PoscanPropertyType.unknown,
          ),
          propValue: PropValue(
            maxValue:
                BigInt.parse(data['maxValue'].toString().replaceAll(',', '')),
            propIdx: id,
          ),
        );
      },
    );
    final resTL = resT.toList();

    resTL.sort(
      (final a, final b) => a.propValue.propIdx.compareTo(b.propValue.propIdx),
    );

    return resTL.toList();
  }

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

  Future<String> putObject({
    required final PutObjectParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final poscanApi = appServiceLoaderCubit.state.plugin.sdk.api.poscan;

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

    return (res as Map).values.join('');
  }
}
