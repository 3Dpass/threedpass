import 'package:auto_route/auto_route.dart';
import 'package:threedpass/router/router.gr.dart';

AutoRoute setMetadataPageRoute = AutoRoute(
  page: SetMetadataRouteWrapper.page,
  children: [
    AutoRoute(
      page: SetMetadataRoute.page,
      path: '',
    ),
  ],
);
