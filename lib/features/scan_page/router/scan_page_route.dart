import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/scan_page/presentation/pages/scan_page.dart';
import 'package:threedpass/features/scan_page/presentation/pages/scan_page_wrapper.dart';
import 'package:threedpass/router/route_names.dart';

const AutoRoute scanPageRoute = AutoRoute(
  page: ScanPageWrapper,
  name: RouteNames.scanPageWrapper,
  children: [
    AutoRoute(
      page: ScanPage,
      name: RouteNames.scanPage,
      path: '',
    ),
  ],
);
