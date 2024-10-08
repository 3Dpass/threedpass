import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute settingsAutoRoute = AutoRoute(
  maintainState: false,
  page: SettingsWrapperRoute.page,
  children: [
    AutoRoute(
      page: SettingsRoute.page,
      path: '',
    ),
    AutoRoute(page: StableHashSubRoute.page),
    AutoRoute(page: WalletNodeSubRoute.page),
    AutoRoute(page: PixelRatioSubRoute.page),
    AutoRoute(page: ChooseAlgorithmSubRoute.page),
    AutoRoute(page: GridSizeSubRoute.page),
    AutoRoute(page: SectionsSubRoute.page),
    AutoRoute(page: TransBytesSubRoute.page),
  ],
);
