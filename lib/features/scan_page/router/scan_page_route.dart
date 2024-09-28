import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute scanPageRoute = AutoRoute(
  page: ScanRouteWrapper.page,
  children: [
    AutoRoute(
      page: ScanRoute.page,
      path: '',
    ),
    CustomRoute(
      page: DeleteSnapshotsRoute.page,
      customRouteBuilder: dialogBuilder,
    ),
  ],
);
