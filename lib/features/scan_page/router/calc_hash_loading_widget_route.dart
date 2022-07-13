import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/router.dart';

const AutoRoute calcHashLoadingWidgetRoute = CustomRoute(
  page: CalcHashLoadingWidget,
  name: RouteNames.calcHashLoadingDialog,
  customRouteBuilder: dialogBuilder,
);
