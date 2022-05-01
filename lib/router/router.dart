import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/compare_page.dart/presentation/pages/compare_page.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/home_page/presentation/pages/home_page.dart';
import 'package:threedpass/features/home_page/presentation/widgets/calc_hash_loading_dialog.dart';
import 'package:threedpass/features/result_page/presentation/pages/preview_page.dart';
import 'package:threedpass/features/result_page/presentation/pages/preview_page_wrapper.dart';
import 'package:threedpass/features/result_page/presentation/widgets/save_hash_dialog.dart';
import 'package:threedpass/features/result_page/presentation/widgets/save_object_dialog.dart';
import 'package:threedpass/features/settings_page/presentation/pages/settings_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
    ),
    AutoRoute(
      page: PreviewPageWrapper,
      name: 'PreviewPageWrapperRoute',
      children: [
        AutoRoute(
          page: PreviewPage,
          name: 'PreviewPageRoute',
          path: '',
        ),
        AutoRoute(
          page: ComparePageWrapper,
        ),
        CustomRoute(
          name: 'SaveObjectDialogRoute',
          page: SaveObjectDialog,
          customRouteBuilder: dialogBuilder,
        ),
        CustomRoute(
          name: 'SaveHashDialogRoute',
          page: SaveHashDialog,
          customRouteBuilder: dialogBuilder,
        ),
      ],
    ),
    AutoRoute(page: SettingsPage),
    CustomRoute(
      name: 'CalcHashLoadingWidgetRoute',
      page: CalcHashLoadingWidget,
      customRouteBuilder: dialogBuilder,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

Route<T> dialogBuilder<T>(
    BuildContext context, Widget child, CustomPage<T> page) {
  return DialogRoute(
    context: context,
    builder: (context) => child,
    settings: page,
    barrierDismissible: false,
  );
}
