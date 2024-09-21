import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:threedpass/core/polkawallet/utils/basic_polkadot_js_call.dart';
import 'package:threedpass/core/utils/logger.dart';

class GetTokensInfoUtility<T> {
  final InAppWebViewController webviewController;
  final T Function(dynamic) toElement;
  final String call;

  const GetTokensInfoUtility({
    required this.webviewController,
    required this.call,
    required this.toElement,
  });

  Future<List<T>> getTokensInfo() async {
    final String getTokensFunc = """
var p = async () => {
  const call = await api.query.poscanAssets.$call.entries();
  const res = call.map(([{ args: [assetId] }, data]) => ({id: assetId.toNumber(), ...data.toHuman(),})).sort((a, b) => a.id - b.id);
  return res;
};
var res = await p();
return res;
""";

    final dynamic res = await basicJSCall(getTokensFunc, webviewController);
    final List<dynamic> tokensRaw = res as List<dynamic>;
    final List<T> tokens = tokensRaw.map(toElement).toList();

    logger.t('res length: ${tokens.length}');
    return tokens;
  }
}
