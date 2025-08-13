import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (final context, final state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: PH16(
            child: Column(
              spacing: 16,
              children: state.notifications
                  .map(
                    (e) => NotificationCard(
                      notificationDTO: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
