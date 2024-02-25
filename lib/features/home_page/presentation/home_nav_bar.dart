import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:unicons/unicons.dart';

class HomeNavBar {
  Widget build(
    final BuildContext context,
    final Widget child,
    // final Animation<double> animation,
  ) {
    final tabsRouter = context.tabsRouter;
    // print('a');
    return PlatformScaffold(
      body: child,
      bottomNavBar: PlatformNavBar(
        // type: BottomNavigationBarType.fixed,
        currentIndex: tabsRouter.activeIndex,
        material: (final _, final __) => MaterialNavBarData(
          type: BottomNavigationBarType.fixed,
          itemChanged: tabsRouter.setActiveIndex,
          elevation: 3,
          height: kBottomNavigationBarHeight,
        ),
        cupertino: (final _, final __) => CupertinoTabBarData(
          itemChanged: tabsRouter.setActiveIndex,
          // backgroundColor: scaffoldColor,
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
    );
  }
}
