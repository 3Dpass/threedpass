import 'dart:convert';
import 'dart:io';

import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/basic_polkadot_js_call.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/domain/usecases/put_object_usecase.dart';

class PoScanPutObjectRepository {
  const PoScanPutObjectRepository({
    required this.appServiceLoaderCubit,
    required this.callSignExtrinsicUtil,
  });

  final AppServiceLoaderCubit appServiceLoaderCubit;
  final CallSignExtrinsicUtil callSignExtrinsicUtil;

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

  Future<void> putObject({
    required final PutObjectParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final file = File(params.pathToFile);
    final bytes = file.readAsStringSync();
    final jbytes = jsonEncode(bytes);

    // bool flag = true;

    final argCat = jsonEncode(params.categoryFabric.build());
    final argNApprovals = jsonEncode(params.nApprovals);

    final hashesToHex = params.hashes.map((final e) => '"0x' + e + '"');
    final hexHashesStr = hashesToHex.join(',');
    final argHashes = '[$hexHashesStr]';

    final argPropValue = encodePropValues(params.propValues);

    final argsEncoded =
        '[$argCat, ${params.isPrivate}, $jbytes, $argNApprovals, $argHashes, $argPropValue]';

    print('argsEncoded = $argsEncoded');

    //       final args = [
    //         params.categoryFabric.build(),
    //         params.nApprovals,
    //       hashesToHex,
    //         params.propValues,
    //   // params.asset1.toJSArg(),
    //   // params.asset2.toJSArg(),
    // ];

    // final argFile = file.toList().map((e) => e.toRadixString(16)).join(''); // 0x$argFile

    // final pseudoHex = hashes.map((e) => '0x' + e).toList();
    // final argHashes = jsonEncode(pseudoHex);

    // final res = serviceRoot.webView!.evalJavascript(
    //   'poScan.txPutObject(api, "$pubKey", "$password", "$msgId", $argCat, $file, $nApprovals, $argHashes, $propValue)',
    // );

    // return Either.right(null);

    // print()

    // return;
    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'poScan', 'putObject'],
      pubKey: params.account.pubKey!,
      password: params.password,
      updateStatus: params.updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }
}
