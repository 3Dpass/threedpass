import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
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
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (final context, final state) {
        final notificationsCount = state.notifications.length;

        return D3pIconButton(
          emptyContraints: true,
          iconData: Icons.notifications_none_outlined,
          iconWidget: notificationsCount > 0
              ? Badge.count(
                  backgroundColor:
                      lastNTypeToBadgeColor(state.notifications.last.status),
                  count: notificationsCount,
                  child: const Icon(Icons.notifications),
                )
              : const Icon(
                  Icons.notifications_none_outlined,
                ),
          onPressed: () => context.router.push(const NotificationsRoute()),
        );
      },
    );
  }
}
