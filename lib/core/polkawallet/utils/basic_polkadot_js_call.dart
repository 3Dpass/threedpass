import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<dynamic> basicJSCall(
  final String jsCode,
  final InAppWebViewController webview,
) async {
  final CallAsyncJavaScriptResult? res = await webview.callAsyncJavaScript(
    functionBody: jsCode,
  );

  return res?.value;
}
