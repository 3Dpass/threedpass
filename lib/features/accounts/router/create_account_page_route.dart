import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/route_paths.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute createAccountPageRoute = AutoRoute(
  page: CreateAccountRouteWrapper.page,
  path: RoutePaths.createAccountMain,
  children: [
    AutoRoute(
      page: CreateAccountTypeRoute.page,
      path: RoutePaths.createAccountChooseType,
    ),
    AutoRoute(
      page: CreateAccountInfoRoute.page,
      path: RoutePaths.createAccountRandomMnemonic,
    ),
    AutoRoute(
      page: CreateAccountMnemonicBackupRoute.page,
    ),
    AutoRoute(
      page: CreateAccountMnemonicConfirmRoute.page,
    ),
    AutoRoute(
      page: CreateAccountCredentialsRoute.page,
    ),
    CustomRoute(
      page: CreateAccountLoaderRoute.page,
      customRouteBuilder: dialogBuilder,
    ),
    CustomRoute(
      page: NoStableHashRoute.page,
      customRouteBuilder: dialogBuilder,
    ),
    // create from object
    AutoRoute(
      page: CreateAccountFromObjectRoute.page,
    ),
    // Import mnemonic
    AutoRoute(
      page: ImportMnemonicFormRoute.page,
    ),
  ],
);
