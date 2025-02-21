import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

final assetsConversionRoute = AutoRoute(
  page: PoolsRouteWrapper.page,
  children: [
    AutoRoute(
      page: PoolsRoute.page,
      path: '',
    ),
    AutoRoute(
      page: AddLiquidityRouteWrapper.page,
    ),
    AutoRoute(
      page: RemoveLiquidityRouteWrapper.page,
    ),
  ],
);
