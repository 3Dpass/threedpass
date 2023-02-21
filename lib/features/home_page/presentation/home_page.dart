import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<HomeContextCubit>(
      create: (final context) => HomeContextCubit(
        HomeContextState(context: context),
      ),
      child: AutoTabsScaffold(
        // scaffoldKey: //https://stackoverflow.com/a/73129922/15776812,
        routes: const [
          ScanWrapperRoute(),
          WalletWrapperRoute(),
          SettingsRoute(),
        ],
        bottomNavigationBuilder: (final context, final tabsRouter) {
          final scaffoldColor =
              Theme.of(context).customColors.scaffoldBackground;
          return PlatformNavBar(
            // type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            material: (final _, final __) => MaterialNavBarData(
              type: BottomNavigationBarType.fixed,
              itemChanged: tabsRouter.setActiveIndex,
              elevation: 3,
            ),
            cupertino: (final _, final __) => CupertinoTabBarData(
              itemChanged: tabsRouter.setActiveIndex,
              backgroundColor: scaffoldColor,
              height: kBottomNavigationBarHeight,
            ),
            // onTap: tabsRouter.setActiveIndex,
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
                label: 'bottom_label_settings'.tr(),
                icon: const Icon(
                  Icons.settings,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
