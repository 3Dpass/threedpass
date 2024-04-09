import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute createAssetPageRoute = AutoRoute(
  page: CreateAssetRouteWrapper.page,
  children: [
    AutoRoute(
      page: CreateAssetRoute.page,
      path: '',
    ),
  ],
);
