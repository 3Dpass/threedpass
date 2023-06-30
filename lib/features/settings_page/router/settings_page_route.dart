import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute settingsAutoRoute = AutoRoute(
  page: SettingsWrapperRoute.page,
  // name: RouteNames.settingsPage,
  children: [
    AutoRoute(
      page: SettingsRoute.page,
      // name: RouteNames.innerSettingsPage,
      path: '',
    ),
    AutoRoute(
      page: StableHashSubRoute.page,
      // name: RouteNames.stableHashSubPage,
    ),
  ],
);
