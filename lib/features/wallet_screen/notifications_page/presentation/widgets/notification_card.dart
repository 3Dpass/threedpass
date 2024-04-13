import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notfication_put_object.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_create_asset_card.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_transfer.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_transfer_batch_card.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notificationDTO, super.key});

  final NotificationDTO notificationDTO;

  @override
  Widget build(final BuildContext context) {
    switch (notificationDTO.type) {
      case NotificationType.transfer:
        return NotificationTransferCard(
          notificationDTO as NotificationTransfer,
        );
      case NotificationType.putObject:
        return NotificationPutObjectCard(
          notificationDTO as NotificationPutObject,
        );
      case NotificationType.transferBatch:
        return NotificationTransferBatchCard(
          notificationDTO as NotificationTransferBatch,
        );
      case NotificationType.createAsset:
        return NotificationCreateAssetCard(
          notificationDTO as NotificationCreateAsset,
        );
    }
  }
}
