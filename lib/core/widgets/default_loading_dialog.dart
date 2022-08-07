import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/router.dart';

class DefaultLoadingDialog extends StatelessWidget {
  const DefaultLoadingDialog({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog(
      useRootNavigator: false,
      context: context,
      barrierDismissible: false,
      builder: (_) => const DefaultLoadingDialog(),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

const AutoRoute defaultLoadingDialog = CustomRoute(
  page: DefaultLoadingDialog,
  name: RouteNames.defaultLoadingDialog,
  customRouteBuilder: dialogBuilder,
);
