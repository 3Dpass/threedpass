import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_cubit.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notificationDTO, super.key});

  final NotificationDTO notificationDTO;

  @override
  Widget build(BuildContext context) {
    return Text(notificationDTO.type.toString());
  }
}
