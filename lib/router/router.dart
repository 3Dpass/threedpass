import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/core/widgets/error_page.dart';
import 'package:threedpass/features/accounts/router/create_account_page_route.dart';
import 'package:threedpass/features/home_page/router/home_page_route.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/router/create_asset_page_route.dart';
import 'package:threedpass/features/preview_page/router/preview_page_route.dart';
import 'package:threedpass/router/router.gr.dart';

// part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Dialog,Route')
class RootRouter extends $RootRouter {
  @override
  RouteType defaultRouteType = const RouteType.adaptive();

  @override
  List<AutoRoute> routes = [
    initialAutoRoute,

    // Preview snapshots
    previewPageRoute,
    // Error page route
    errorPageRoute,
    // Create account route
    createAccountPageRoute,
    // Uploaded objecy route
    AutoRoute(
      page: UploadedObjectRoute.page,
    ),
    // Create asset route
    createAssetPageRoute,
    // Default loader
    defaultLoadingDialog,
  ];
}

Route<T> dialogBuilder<T>(
  final BuildContext context,
  final Widget child,
  final AutoRoutePage<T> page,
) {
  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return DialogRoute(
        context: context,
        builder: (final context) => child,
        settings: page,
        barrierDismissible: false,
      );
    case TargetPlatform.macOS:
    case TargetPlatform.iOS:
      return CupertinoDialogRoute(
        context: context,
        builder: (final context) => child,
        settings: page,
        barrierDismissible: false,
      );
  }
}
