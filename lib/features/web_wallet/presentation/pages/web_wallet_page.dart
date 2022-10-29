import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWalletPage extends StatelessWidget {
  const WebWalletPage({
    required this.initialUrl,
    final Key? key,
  }) : super(key: key);
  final String initialUrl;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor:
            Colors.grey[800], // Doesn't make any sense to move color to theme
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: initialUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
