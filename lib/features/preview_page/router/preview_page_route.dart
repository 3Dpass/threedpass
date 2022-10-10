import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/compare_page/presentation/pages/compare_page_wrapper.dart';
import 'package:threedpass/features/preview_page/presentation/preview_page.dart';
import 'package:threedpass/features/preview_page/presentation/preview_page_wrapper.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/rename_snapshot_dialog.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/save_hash_dialog.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/save_object_dialog/save_object_dialog.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/save_top_hashes_dialog/save_top_hashes_dialog.dart';
import 'package:threedpass/router/route_names.dart';
import 'package:threedpass/router/router.dart';

const AutoRoute previewPageRoute = AutoRoute(
  page: PreviewPageWrapper,
  name: RouteNames.previewPageWrapper,
  children: [
    AutoRoute(
      page: PreviewPage,
      name: RouteNames.previewPage,
      path: '',
    ),
    AutoRoute(
      page: ComparePageWrapper,
      name: RouteNames.comparePageWrapper,
    ),
    CustomRoute(
      name: RouteNames.saveTopHashesDialog,
      page: SaveTopHashesDialog,
      customRouteBuilder: dialogBuilder,
    ),
    CustomRoute(
      name: RouteNames.saveObjectDialog,
      page: SaveObjectDialog,
      customRouteBuilder: dialogBuilder,
    ),
    CustomRoute(
      name: RouteNames.saveHashDialog,
      page: SaveHashDialog,
      customRouteBuilder: dialogBuilder,
    ),
    CustomRoute(
      name: RouteNames.renameSnapshotDialog,
      page: RenameSnapshotDialog,
      customRouteBuilder: dialogBuilder,
    ),
  ],
);
