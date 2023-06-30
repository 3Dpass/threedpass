import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/scan_page/router/scan_page_route.dart';
import 'package:threedpass/features/settings_page/router/settings_page_route.dart';
import 'package:threedpass/features/wallet_screen/router/wallet_page_route.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute homePageAutoRoute = AutoRoute(
  page: HomeRoute.page,
  path: '/',
  initial: true,
  children: [
    scanPageRoute,
    walletPageRoute,
    settingsAutoRoute,
  ],
);
