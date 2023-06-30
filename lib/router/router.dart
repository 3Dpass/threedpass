import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/core/widgets/error_page.dart';
import 'package:threedpass/features/accounts/router/create_account_page_route.dart';
import 'package:threedpass/features/home_page/router/home_page_route.dart';
import 'package:threedpass/features/preview_page/router/preview_page_route.dart';
import 'package:threedpass/features/scan_page/router/calc_hash_loading_widget_route.dart';
import 'package:threedpass/router/router.gr.dart';

// part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Dialog,Route')
class RootRouter extends $RootRouter {
  @override
  RouteType defaultRouteType = const RouteType.adaptive();

  @override
  List<AutoRoute> routes = [
    homePageAutoRoute,

    // Preview snapshots
    previewPageRoute,
    // Error page route
    errorPageRoute,
    // Create account route
    createAccountPageRoute,
    // Loader for scan page
    calcHashLoadingWidgetRoute,
    // Default loader
    defaultLoadingDialog,
  ];
}

// @AdaptiveAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[
//     // Root route with bottom bar
//     homePageAutoRoute,
//     // Preview snapshots
//     previewPageRoute,

//     // Error page route
//     errorPageRoute,

//     // Create account route
//     createAccountPageRoute,

//     // Loader for scan page
//     calcHashLoadingWidgetRoute,
//     // Default loader
//     defaultLoadingDialog,
//   ],
// )
// class $AppRouter {}

Route<T> dialogBuilder<T>(
  final BuildContext context,
  final Widget child,
  final AutoRoutePage<T> page,
) {
  return DialogRoute(
    context: context,
    builder: (final context) => child,
    settings: page,
    barrierDismissible: false,
  );
}
