import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/notifications_page/widgets/notification_card.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (final context, final state) {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 8),
          itemCount: state.notifications.length,
          shrinkWrap: true,
          itemBuilder: (final _, final index) {
            return NotificationCard(
              notificationDTO: state.notifications[index],
            );
          },
        );
      },
    );
  }
}
