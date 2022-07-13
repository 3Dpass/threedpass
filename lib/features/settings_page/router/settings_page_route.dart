import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/settings_page/presentation/pages/settings_page.dart';
import 'package:threedpass/router/route_names.dart';

const AutoRoute settingsAutoRoute = AutoRoute(
  page: SettingsPage,
  name: RouteNames.settingsPage,
);
