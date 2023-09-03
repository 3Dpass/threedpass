import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class NotificationsIconButton extends StatelessWidget {
  const NotificationsIconButton({super.key});

  void onPressed(final BuildContext context) {
    // final outerContext = BlocProvider.of<HomeContextCubit>(context).state;

    context.router.push(const NotificationsRoute());
  }

  @override
  Widget build(final BuildContext context) {
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

        return badges.Badge(
          badgeContent: Text(state.notifications.length.toString()),
          position: badges.BadgePosition.topEnd(top: 2, end: 2),
          badgeAnimation: const BadgeAnimation.scale(),
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
