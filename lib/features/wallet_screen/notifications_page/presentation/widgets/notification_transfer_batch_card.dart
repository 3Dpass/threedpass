import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/safe_transaction_body.dart';

class NotificationTransferBatchCard extends StatelessWidget {
  final NotificationTransferBatch notificationDTO;

  const NotificationTransferBatchCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBasic(
      message: notificationDTO.message,
      status: notificationDTO.status,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notificationDTO.toAddress.length,
        itemBuilder: (final _, final index) => SafeTransactionBody(
          fromAddress: notificationDTO.fromAddress,
          toAddress: notificationDTO.toAddress[index],
          amount: notificationDTO.amount[index],
          symbols: notificationDTO.symbols,
          blockDateTime: notificationDTO.blockDateTime,
        ),
      ),
    );
  }
}
