import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/setup.dart';

class GetTokensInfoUtility<T> {
  final AppService appService;
  final T Function(dynamic) toElement;
  final String call;

  const GetTokensInfoUtility({
    required this.appService,
    required this.call,
    required this.toElement,
  });

  Future<Either<Failure, List<T>>> getTokensInfo() async {
    final String getTokensFunc = """
var p = async () => {
  const call = await api.query.poscanAssets.$call.entries();
  const res = call.map(([{ args: [assetId] }, data]) => ({id: assetId.toNumber(), ...data.toHuman(),})).sort((a, b) => a.id - b.id);
  return res;
};
var res = await p();
return res;
""";

    // TODO Typecast to CallAsyncJavaScriptResult from inappwebview
    final dynamic res = await appService.plugin.sdk.api.universal.service
        .serviceRoot.webView!.webInstance!.webViewController
        .callAsyncJavaScript(
      functionBody: getTokensFunc,
    );

    final dynamic json = jsonEncode(res);
    print(json);

    try {
      final List<dynamic> tokensRaw = res.value as List<dynamic>;
      final List<T> tokens = tokensRaw.map(toElement).toList();
      return Either.right(tokens);
    } on Object catch (e) {
      getIt<Logger>().e(e);
      return Either.left(
          NoDataFailure('Error: $e')); // TODO Add polkadot error type
    }
  }
}
