import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

final AutoRoute explorerPageRoute = AutoRoute(
  page: ExplorerRouteWrapper.page,
  children: [
    AutoRoute(
      page: ObjectsListRoute.page,
      path: '',
    ),
  ],
);
