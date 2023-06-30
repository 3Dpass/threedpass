import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute scanPageRoute = AutoRoute(
  page: ScanRouteWrapper.page,
  // name: RouteNames.scanPageWrapper,
  children: [
    AutoRoute(
      page: ScanRoute.page,
      // name: RouteNames.scanPage,
      path: '',
    ),
  ],
);
