import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class DefaultLoadingDialog extends StatelessWidget {
  const DefaultLoadingDialog({final Key? key, this.text}) : super(key: key);

  final String? text;

  static void show(
    final BuildContext context, [
    final String? text,
  ]) =>
      showAdaptiveDialog(
        context: context,
        builder: (final _) => DefaultLoadingDialog(text: text),
        barrierDismissible: false,
        useRootNavigator: false,
      );

  static void hide(final BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(final BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 42,
        height: 84,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}

final AutoRoute defaultLoadingDialog = CustomRoute(
  page: DefaultLoadingRoute.page,
  customRouteBuilder: dialogBuilder,
);
