import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/router.dart';

class DefaultLoadingDialog extends StatelessWidget {
  const DefaultLoadingDialog({Key? key, this.text}) : super(key: key);

  final String? text;

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
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
      // WillPopScope(
      //   onWillPop: () async => false,
      //   child: SizedBox(
      //     // height: 69,
      //     child: Center(
      //       child:
      // Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           PlatformCircularProgressIndicator(),
      //           text != null
      //               ? Row(
      //                   children: [
      //                     const SizedBox(width: 24),
      //                     Text(
      //                       text!,
      //                     ),
      //                   ],
      //                 )
      //               : const SizedBox(),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

const AutoRoute defaultLoadingDialog = CustomRoute(
  page: DefaultLoadingDialog,
  name: RouteNames.defaultLoadingDialog,
  customRouteBuilder: dialogBuilder,
);
