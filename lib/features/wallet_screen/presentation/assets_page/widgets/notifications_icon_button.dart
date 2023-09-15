import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/router/router.gr.dart';

class NotificationsIconButton extends StatelessWidget {
  const NotificationsIconButton({super.key});

  void onPressed(final BuildContext context) {
    // final outerContext = BlocProvider.of<HomeContextCubit>(context).state;

    context.router.push(const NotificationsRoute());
  }

  @override
  Widget build(final BuildContext context) {
    final customTextStyles = Theme.of(context).customTextStyles;
    // final customColors = Theme.of(context).customColors;

    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (final context, final state) {
        if (state.notifications.isEmpty) {
          return SizedBox(
            height: kToolbarHeight,
            child: D3pIconButton(
              iconData: Icons.notifications_none_outlined,
              onPressed: () => onPressed(context),
            ),
          );
        }
        bool hasErrors = false;
        for (final notification in state.notifications) {
          if (notification.status == ExtrisincStatus.failed) {
            hasErrors = true;
          }
        }

        final String badgeText = state.notifications.length.toString();
        final badgeColor = hasErrors ? Colors.red : D3pThemeData.mainColor;

        return badges.Badge(
          badgeContent: Text(
            badgeText,
            style: customTextStyles.d3pBodyMedium.copyWith(color: Colors.white),
          ),
          position: badges.BadgePosition.topEnd(top: 2, end: 2),
          badgeAnimation: const BadgeAnimation.scale(),
          badgeStyle: BadgeStyle(badgeColor: badgeColor),
          child: SizedBox(
            height: kToolbarHeight,
            child: D3pIconButton(
              iconData: Icons.notifications,
              onPressed: () => onPressed(context),
            ),
          ),
        );
      },
    );
  }
}
