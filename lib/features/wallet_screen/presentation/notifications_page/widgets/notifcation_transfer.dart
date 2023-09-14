import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_cubit.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/transaction_item.dart';

class NotificationTransferCard extends StatelessWidget {
  final NotificationDTO notificationDTO;

  const NotificationTransferCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    final cardBG = notificationDTO.status == ExtrisincStatus.failed
        ? Theme.of(context).customColors.errorCardBGColor
        : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: cardBG,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const D3pBodyMediumText('transfer_status'),
                    const SizedBox(width: 8),
                    _TransferStatus(notificationDTO.status),
                  ],
                ),
                const SizedBoxH4(),
                _Message(notificationDTO.message, notificationDTO.status),
                TransactionItem(
                  object: TransferHistoryUI(
                    amount: notificationDTO.amount ?? 'error amount',
                    decimals: 1,
                    symbols: notificationDTO.symbols ?? 'error symbol',
                    direction: TransferDirection.all,
                    blockDateTime: notificationDTO.blockDateTime,
                    fromAddress: notificationDTO.fromAddresses!.first,
                    toAddress: notificationDTO.toAddresses!.first,
                    extrisincStatus: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TransferStatus extends StatelessWidget {
  const _TransferStatus(this.status);

  final ExtrisincStatus status;

  @override
  Widget build(final BuildContext context) {
    switch (status) {
      case ExtrisincStatus.loading:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: const Row(
            children: [
              D3pBodyMediumText('status_pending'),
              SizedBox(width: 8),
              Icon(
                Icons.access_time_outlined,
                size: 16,
              ),
            ],
          ),
        );
      case ExtrisincStatus.success:
        return const D3pBodyMediumText(
          'status_success',
          color: Colors.green,
        );
      case ExtrisincStatus.error:
      case ExtrisincStatus.failed:
        return const D3pBodyMediumText(
          'status_failed',
          // color: Colors.red,
        );
    }
  }
}

class _Message extends StatelessWidget {
  final String? message;
  final ExtrisincStatus? status;

  const _Message(this.message, this.status);

  @override
  Widget build(final BuildContext context) {
    if (message != null && status != ExtrisincStatus.success) {
      return Column(
        children: [
          D3pBodyLargeText(
            message!,
            translate: false,
          ),
          const SizedBoxH4(),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
