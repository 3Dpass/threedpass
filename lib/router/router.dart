import 'package:auto_route/auto_route.dart';
import 'package:threedpass/features/compare_page.dart/presentation/pages/compare_page.dart';
import 'package:threedpass/features/home_page/presentation/pages/home_page.dart';
import 'package:threedpass/features/result_page/presentation/pages/preview_page.dart';
import 'package:threedpass/features/result_page/presentation/pages/preview_page_wrapper.dart';
import 'package:threedpass/features/settings_page/presentation/pages/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
    ),
    AutoRoute(
      page: PreviewPageWrapper,
      name: 'PreviewRoute',
      children: [
        AutoRoute(
          page: PreviewPage,
          name: 'PreviewPage',
          path: '',
        ),
        AutoRoute(
          page: ComparePage,
        ),
      ],
    ),
    AutoRoute(page: SettingsPage),
  ],
)
class $AppRouter {}
