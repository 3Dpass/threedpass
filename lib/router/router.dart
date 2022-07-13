import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/error_page.dart';
import 'package:threedpass/features/accounts/router/create_account_page_route.dart';
import 'package:threedpass/features/explorer/router/explorer_page_route.dart';
import 'package:threedpass/features/home_page/router/home_page_route.dart';
import 'package:threedpass/features/scan_page/router/calc_hash_loading_widget_route.dart';

// part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // Root route with bottom bar
    homePageAutoRoute,
    // web explorer page
    explorerPageRoute,
    // Create account way
    createAccountPageRoute,

    // Error page route
    errorPageRoute,

    // Loader for scan page
    calcHashLoadingWidgetRoute,
  ],
)
class $AppRouter {}

Route<T> dialogBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return DialogRoute(
    context: context,
    builder: (context) => child,
    settings: page,
    barrierDismissible: false,
  );
}
