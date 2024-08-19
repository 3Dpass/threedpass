import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:unicons/unicons.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<HomeContextCubit>(
      create: (final __) => HomeContextCubit(
        HomeContextState(context: context),
      ),
      child: AutoTabsScaffold(
        routes: const [
          ScanRouteWrapper(),
          WalletRouteWrapper(),
          ExplorerRouteWrapper(),
          SettingsRoute(),
        ],
        bottomNavigationBuilder: (final context, final tabsRouter) =>
            BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          selectedItemColor: Theme.of(context).focusColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: 'bottom_label_scan'.tr(),
              icon: const Icon(
                Icons.camera,
              ),
            ),
            BottomNavigationBarItem(
              label: 'bottom_label_wallet'.tr(),
              icon: const Icon(
                Icons.account_balance_wallet,
              ),
            ),
            BottomNavigationBarItem(
              label: 'bottom_label_explorer'.tr(),
              icon: const Icon(
                UniconsLine.object_group,
              ),
            ),
            BottomNavigationBarItem(
              label: 'bottom_label_settings'.tr(),
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
      ),

      //  AutoTabsRouter(
      //   routes: const [
      //     ScanRouteWrapper(),
      //     WalletRouteWrapper(),
      //     ExplorerRouteWrapper(),
      //     SettingsRoute(),
      //   ],
      //   builder: HomeNavBar().build,
      // ),
    );
  }
}
