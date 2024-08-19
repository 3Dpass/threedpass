import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class DefaultLoadingDialog extends StatelessWidget {
  const DefaultLoadingDialog({final Key? key, this.text}) : super(key: key);

  final String? text;

  static void show(final BuildContext context, [final String? text]) {
    showPlatformDialog<void>(
      useRootNavigator: false,
      context: context,
      barrierDismissible: false,
      builder: (final _) => DefaultLoadingDialog(
        text: text,
      ),
    );
  }

  static void hide(final BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(final BuildContext context) {
    return PlatformAlertDialog(
      content: WillPopScope(
        onWillPop: () async => false,
        child: SizedBox(
          height: 42,
          width: 42,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const D3pProgressIndicator(size: null),
                text != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(text!),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

AutoRoute defaultLoadingDialog = CustomRoute(
  page: DefaultLoadingRoute.page,
  customRouteBuilder: dialogBuilder,
);
