import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/router/router.gr.dart';

class NotificationsIconButton extends StatelessWidget {
  const NotificationsIconButton({super.key});

  Color lastNTypeToBadgeColor(final ExtrinsicStatus status) {
    switch (status) {
      case ExtrinsicStatus.failed:
        return Colors.red;
      case ExtrinsicStatus.error:
        return Colors.red;
      case ExtrinsicStatus.success:
        return D3pThemeData.mainColor;
      case ExtrinsicStatus.loading:
        return D3pColors.disabled;
    }
  }

  @override
  Widget build(final BuildContext context) {
    final customTextStyles = Theme.of(context).customTextStyles;
    // final customColors = Theme.of(context).customColors;

    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (final context, final state) {
        if (state.notifications.isEmpty) {
          return const _NotificationIcon();
        }

        final String badgeText = state.notifications.length.toString();
        final badgeColor = state.notifications.isNotEmpty
            ? lastNTypeToBadgeColor(state.notifications.reversed.last.status)
            : Colors.green;

        return badges.Badge(
          badgeContent: Text(
            badgeText,
            style: customTextStyles.d3pBodyMedium.copyWith(color: Colors.white),
          ),
          position: badges.BadgePosition.topEnd(top: 2, end: -8),
          badgeAnimation: const BadgeAnimation.scale(),
          badgeStyle: BadgeStyle(badgeColor: badgeColor),
          child: const _NotificationIcon(),
        );
      },
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  const _NotificationIcon();

  void onPressed(final BuildContext context) {
    context.router.push(const NotificationsRoute());
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      // width: D3pAddressIcon.defaultSize,
      height: kToolbarHeight,
      child: Align(
        child: D3pIconButton(
          emptyContraints: true,
          iconData: Icons.notifications_none_outlined,
          onPressed: () => onPressed(context),
        ),
      ),
    );
  }
}
