import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute mintAssetPageRoute = AutoRoute(
  page: MintAssetRouteWrapper.page,
  children: [
    AutoRoute(
      page: MintAssetRoute.page,
      path: '',
    ),
  ],
);
