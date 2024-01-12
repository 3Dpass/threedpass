import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/widgets/transaction_item.dart';

class SafeTransactionBody extends StatelessWidget {
  const SafeTransactionBody({
    required this.amount,
    required this.fromAddress,
    required this.toAddress,
    required this.blockDateTime,
    required this.symbols,
    super.key,
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
