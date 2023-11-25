import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute previewPageRoute = AutoRoute(
  page: PreviewRouteWrapper.page,
  children: [
    AutoRoute(
      page: PreviewRoute.page,
      path: '',
    ),
    AutoRoute(
      page: CompareRouteWrapper.page,
    ),
    CustomRoute(
      page: SaveObjectRoute.page,
      customRouteBuilder: dialogBuilder,
    ),
    CustomRoute(
      page: SaveHashRoute.page,
      customRouteBuilder: dialogBuilder,
    ),
    CustomRoute(
      page: RenameSnapshotRoute.page,
      customRouteBuilder: dialogBuilder,
    ),
    CustomRoute(
      page: DeleteSnapshotRoute.page,
      customRouteBuilder: dialogBuilder,
    ),
    AutoRoute(
      page: D3PRPCRouteWrapper.page,
      children: [
        AutoRoute(
          page: D3PRPCRoute.page,
          path: '',
        ),
      ],
    ),
  ],
);
