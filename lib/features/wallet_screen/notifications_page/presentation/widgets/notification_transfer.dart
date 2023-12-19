import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/presentation/widgets/notification_card_basic.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/widgets/transaction_item.dart';

class NotificationTransferCard extends StatelessWidget {
  final NotificationTransfer notificationDTO;

  const NotificationTransferCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    return NotificationCardBasic(
      message: notificationDTO.message,
      status: notificationDTO.status,
      child: _Transaction(
        fromAddress: notificationDTO.fromAddress,
        toAddress: notificationDTO.toAddress,
        amount: notificationDTO.amount,
        symbols: notificationDTO.symbols,
        blockDateTime: notificationDTO.blockDateTime,
      ),
    );
  }
}

class _Transaction extends StatelessWidget {
  const _Transaction({
    required this.amount,
    required this.fromAddress,
    required this.toAddress,
    required this.blockDateTime,
    required this.symbols,
  });

  final String? fromAddress;
  final String? toAddress;
  final String? amount;
  final String? symbols;
  final DateTime? blockDateTime;

  @override
  Widget build(final BuildContext context) {
    if (fromAddress != null && toAddress != null && amount != null) {
      return TransactionItem(
        object: TransferHistoryUI(
          amount: amount!,
          decimals: 1,
          symbols: symbols ?? '',
          direction: TransferDirection
              .all, // Transfers are always "from", but from different accounts
          blockDateTime: blockDateTime,
          fromAddress: fromAddress!,
          toAddress: toAddress!,
          extrisincStatus: null,
        ),
      );
      // },
      // );
    } else {
      return const SizedBox();
    }
  }
}
