import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
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
                PlatformCircularProgressIndicator(),
                text != null
                    ? Row(
                        children: [
                          const SizedBox(width: 24),
                          Text(
                            text!,
                            style: Theme.of(context)
                                .customTextStyles
                                .d3pBodyMedium,
                          ),
                        ],
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
