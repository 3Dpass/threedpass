import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/fast_notification_tile.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxH8(),
        const FastNotificationTile(
          iconData: Icons.keyboard_double_arrow_right,
          child: D3pBodyMediumText(
            'poscanAsset.create',
            translate: false,
          ),
        ),
        const SizedBoxH8(),
        FastNotificationTile(
          iconData: Icons.person,
          child: AccountChooseTileText(
            address: notificationDTO.admin.address,
            name: notificationDTO.admin.name,
          ),
        ),
        SizedBoxH8(),
        FastNotificationTile(
          iconData: Icons.file_copy,
          child: Flexible(
            child: D3pBodyMediumText(
              notificationDTO.assetId,
              translate: false,
            ),
          ),
        ),
      ],
    );
  }
}
