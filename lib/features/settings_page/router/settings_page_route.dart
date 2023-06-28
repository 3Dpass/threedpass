import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/settings_page/presentation/settings_page.dart';
import 'package:threedpass/features/settings_page/presentation/settings_sub_page/stable_hash_subpage.dart';
import 'package:threedpass/router/route_names.dart';

const AutoRoute settingsAutoRoute = AutoRoute(
  page: EmptyRouterPage,
  name: RouteNames.settingsPage,
  children: [
    AutoRoute(
      page: SettingsPage,
      name: RouteNames.innerSettingsPage,
      path: '',
    ),
    AutoRoute(
      page: StableHashSubPage,
      name: RouteNames.stableHashSubPage,
    ),
  ],
);
