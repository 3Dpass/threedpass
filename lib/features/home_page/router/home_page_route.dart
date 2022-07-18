import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/accounts/router/create_account_page_route.dart';
import 'package:threedpass/features/home_page/presentation/home_page.dart';
import 'package:threedpass/features/scan_page/router/scan_page_route.dart';
import 'package:threedpass/features/settings_page/router/settings_page_route.dart';
import 'package:threedpass/features/wallet_page/router/wallet_page_route.dart';
import 'package:threedpass/router/route_names.dart';

const AutoRoute homePageAutoRoute = AutoRoute(
  page: HomePage,
  name: RouteNames.homePage,
  path: '/',
  initial: true,
  children: [
    scanPageRoute,
    walletPageRoute,
    settingsAutoRoute,
  ],
);
