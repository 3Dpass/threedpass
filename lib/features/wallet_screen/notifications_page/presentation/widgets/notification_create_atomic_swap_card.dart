import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/fast_notification_tile.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_body_basic.dart';

class NotificationCreateAtomicSwapCard extends StatelessWidget {
  final NotificationCreateAtomicSwap notificationDTO;

  const NotificationCreateAtomicSwapCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBasic(
      message: notificationDTO.message,
      status: notificationDTO.status,
      child: _Body(
        notificationDTO: notificationDTO,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final NotificationCreateAtomicSwap notificationDTO;

  const _Body({required this.notificationDTO});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBodyBasic(
      children: [
        FastNotificationTile(
          iconData: Icons.keyboard_double_arrow_right,
          child: D3pBodyMediumText(
            notificationDTO.isPoscan
                ? 'poscanAtomicSwap.createSwap'
                : 'atomicSwap.createSwap',
            translate: false,
          ),
        ),
        FastNotificationTile(
          iconData: Icons.person,
          child: AccountChooseTileText(
            address: notificationDTO.from.address,
            name: notificationDTO.from.name,
          ),
        ),
        FastNotificationTile(
          iconData: Icons.arrow_right_alt,
          child: AccountChooseTileText(
            address: notificationDTO.to.address,
            name: notificationDTO.to.name,
          ),
        ),
      ],
    );
  }
}
