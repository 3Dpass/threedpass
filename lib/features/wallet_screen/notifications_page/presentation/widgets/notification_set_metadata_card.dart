import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/fast_notification_tile.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_body_basic.dart';

class NotificationSetMetadataCard extends StatelessWidget {
  final NotificationSetMetadata notificationDTO;

  const NotificationSetMetadataCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBasic(
      message: notificationDTO.message,
      status: notificationDTO.status,
      child: _SetMetadataBody(
        notificationDTO: notificationDTO,
      ),
    );
  }
}

class _SetMetadataBody extends StatelessWidget {
  final NotificationSetMetadata notificationDTO;

  const _SetMetadataBody({required this.notificationDTO});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBodyBasic(
      children: [
        const FastNotificationTile(
          iconData: Icons.keyboard_double_arrow_right,
          child: D3pBodyMediumText(
            'poscanAsset.setMetadata',
            translate: false,
          ),
        ),
        FastNotificationTile(
          iconData: Icons.person,
          child: AccountChooseTileText(
            address: notificationDTO.admin.address,
            name: notificationDTO.admin.name,
          ),
        ),
        FastNotificationTile(
          iconData: Icons.token,
          child: Flexible(
            child: FastRichText(
              mainText: notificationDTO.assetId,
              secondaryText: 'set_metadata_notification_asset_id'.tr(),
              needSpace: true,
            ),
          ),
        ),
      ],
    );
  }
}
