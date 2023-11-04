import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/presentation/notifications_page/widgets/notifcation_transfer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notificationDTO, super.key});

  final NotificationDTO notificationDTO;

  @override
  Widget build(final BuildContext context) {
    switch (notificationDTO.type) {
      case NotificationType.transfer:
        return NotificationTransferCard(notificationDTO);
      case NotificationType.vote:
        return Text('Not implemented yet');
    }
  }
}
