import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/safe_transaction_body.dart';

class NotificationTransferCard extends StatelessWidget {
  final NotificationTransfer notificationDTO;

  const NotificationTransferCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBasic(
      message: notificationDTO.message,
      status: notificationDTO.status,
      child: SafeTransactionBody(
        fromAddress: notificationDTO.fromAddress,
        toAddress: notificationDTO.toAddress,
        amount: notificationDTO.amount,
        symbols: notificationDTO.symbols,
        blockDateTime: notificationDTO.blockDateTime,
      ),
    );
  }
}
