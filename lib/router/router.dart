import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/error_page.dart';
import 'package:threedpass/features/compare_page.dart/presentation/pages/compare_page_wrapper.dart';

import 'package:threedpass/features/explorer/presentation/pages/explorer_page.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/home_page/presentation/home_page.dart';
import 'package:threedpass/features/preview_page/presentation/pages/preview_page.dart';
import 'package:threedpass/features/preview_page/presentation/pages/preview_page_wrapper.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/rename_snapshot_dialog.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/save_hash_dialog.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/save_object_dialog.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/save_top_hashes_dialog.dart';
import 'package:threedpass/features/scan_page/presentation/pages/scan_page.dart';
import 'package:threedpass/features/scan_page/presentation/pages/scan_page_wrapper.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/calc_hash_loading_dialog.dart';
import 'package:threedpass/features/settings_page/presentation/pages/settings_page.dart';
import 'package:threedpass/features/wallet/presentation/wallet_page.dart';
import 'package:threedpass/router/route_names.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      name: RouteNames.homePage,
      path: '/',
      initial: true,
      children: [
        AutoRoute(
          page: ScanPageWrapper,
          name: RouteNames.scanPageWrapper,
          children: [
            AutoRoute(
              page: ScanPage,
              name: RouteNames.scanPage,
              path: '',
            ),
            AutoRoute(
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
            ),
          ],
        ),
        AutoRoute(
          page: WalletPage,
          name: RouteNames.walletPage,
        ),
        AutoRoute(
          page: SettingsPage,
          name: RouteNames.settingsPage,
        ),

        // Loader
        CustomRoute(
          name: RouteNames.calcHashLoadingDialog,
          page: CalcHashLoadingWidget,
          customRouteBuilder: dialogBuilder,
        ),
      ],
    ),
    AutoRoute(
      page: ExplorerPage,
      name: RouteNames.exolorerPage,
    ),
    AutoRoute(
      page: ErrorPage,
      name: RouteNames.errorPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

Route<T> dialogBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return DialogRoute(
    context: context,
    builder: (context) => child,
    settings: page,
    barrierDismissible: false,
  );
}
