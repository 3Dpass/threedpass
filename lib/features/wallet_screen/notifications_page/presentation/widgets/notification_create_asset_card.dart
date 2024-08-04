import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/fast_notification_tile.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_body_basic.dart';

class NotificationCreateAssetCard extends StatelessWidget {
  final NotificationCreateAsset notificationDTO;

  const NotificationCreateAssetCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBasic(
      message: notificationDTO.message,
      status: notificationDTO.status,
      child: _CreateAssetBody(
        notificationDTO: notificationDTO,
      ),
    );
  }
}

class _CreateAssetBody extends StatelessWidget {
  final NotificationCreateAsset notificationDTO;

  const _CreateAssetBody({required this.notificationDTO});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBodyBasic(
      children: [
        const FastNotificationTile(
          iconData: Icons.keyboard_double_arrow_right,
          child: D3pBodyMediumText(
            'poscanAsset.create',
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
          child: FastRichText(
            mainText: notificationDTO.newAssetId,
            secondaryText: 'create_asset_notification_new_asset_id'.tr(),
            needSpace: true,
          ),
        ),
        if (notificationDTO.objDetails != null)
          FastNotificationTile(
            iconData: Icons.data_object,
            child: FastRichText(
              mainText: notificationDTO.objDetails!.objIdx,
              secondaryText: 'create_asset_notification_object_id'.tr(),
              needSpace: true,
            ),
          ),
      ],
    );
  }
}
