import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/common/accounts_identity/account_idenity.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/fast_notification_tile.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_body_basic.dart';

class NotificationClaimPoscanAtomicSwapCard extends StatelessWidget {
  final NotificationClaimPoscanAtomicSwap notificationDTO;

  const NotificationClaimPoscanAtomicSwapCard(this.notificationDTO,
      {super.key});

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
  final NotificationClaimPoscanAtomicSwap notificationDTO;

  const _Body({required this.notificationDTO});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBodyBasic(
      children: [
        FastNotificationTile(
          iconData: Icons.keyboard_double_arrow_right,
          child: D3pBodyMediumText(
            'poscanAtomicSwap.claimSwap',
            translate: false,
          ),
        ),
        FastNotificationTile(
          iconData: Icons.person,
          child: AccountIdentity(
            address: notificationDTO.swap.from,
            prefix: 'address_from_prefix'.tr(),
            colorSecondary: false,
            needCopyButton: false,
          ),
        ),
        FastNotificationTile(
          iconData: Icons.person,
          child: AccountIdentity(
            address: notificationDTO.swap.to,
            prefix: 'address_to_prefix'.tr(),
            colorSecondary: false,
            needCopyButton: false,
          ),
        ),
      ],
    );
  }
}
