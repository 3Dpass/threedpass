import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/fast_notification_tile.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';

class NotificationPutObjectCard extends StatelessWidget {
  final NotificationPutObject notificationDTO;

  const NotificationPutObjectCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBasic(
      message: notificationDTO.message,
      status: notificationDTO.status,
      child: _PutObjectBody(
        notificationDTO: notificationDTO,
      ),
    );
  }
}

class _PutObjectBody extends StatelessWidget {
  final NotificationPutObject notificationDTO;

  const _PutObjectBody({required this.notificationDTO});

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const H8(),
        const FastNotificationTile(
          iconData: Icons.keyboard_double_arrow_right,
          child: D3pBodyMediumText(
            'poScan.putObject',
            translate: false,
          ),
        ),
        const H8(),
        FastNotificationTile(
          iconData: Icons.person,
          child: AccountChooseTileText(
            address: notificationDTO.account.address,
            name: notificationDTO.account.name,
          ),
        ),
        const H8(),
        FastNotificationTile(
          iconData: Icons.file_copy,
          child: D3pBodyMediumText(
            notificationDTO.localSnapshotName,
            translate: false,
          ),
        ),
      ],
    );
  }
}
