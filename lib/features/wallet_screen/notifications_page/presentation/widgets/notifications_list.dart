import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (final context, final state) {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
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
