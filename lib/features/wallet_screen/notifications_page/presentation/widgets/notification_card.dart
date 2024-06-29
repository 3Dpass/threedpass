import 'package:flutter/material.dart';
import 'package:threedpass/features/asset_conversion/ui/add_liquidity/presentation/widgets/add_liquidity_notification_card.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/presentation/widgets/create_pool_asset_card.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notfication_put_object.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_create_asset_card.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_mint_asset_card.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_set_metadata_card.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_transfer.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_transfer_batch_card.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notificationDTO, super.key});

  final NotificationDTO notificationDTO;

  @override
  Widget build(final BuildContext context) {
    return switch (notificationDTO.type) {
      NotificationType.transfer => NotificationTransferCard(
          notificationDTO as NotificationTransfer,
        ),
      NotificationType.putObject => NotificationPutObjectCard(
          notificationDTO as NotificationPutObject,
        ),
      NotificationType.transferBatch => NotificationTransferBatchCard(
          notificationDTO as NotificationTransferBatch,
        ),
      NotificationType.createAsset => NotificationCreateAssetCard(
          notificationDTO as NotificationCreateAsset,
        ),
      NotificationType.setMetadata => NotificationSetMetadataCard(
          notificationDTO as NotificationSetMetadata,
        ),
      NotificationType.mintAsset => NotificationMintAssetCard(
          notificationDTO as NotificationMintAsset,
        ),
      NotificationType.createPool => CreatePoolAssetCard(
          notificationDTO as NotificationCreatePool,
        ),
      NotificationType.addLiquidity => AddLiquidityNotificationCard(
          notificationDTO as NotificationAddLiquidity,
        ),
    };
  }
}
