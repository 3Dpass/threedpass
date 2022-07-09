import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({
    Key? key,
    required this.initialUrl,
  }) : super(key: key);
  final String initialUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.grey[800],
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
