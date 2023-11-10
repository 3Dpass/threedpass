import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/bloc/notifications_bloc.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/transaction_item.dart';

class NotificationTransferCard extends StatelessWidget {
  final NotificationDTO notificationDTO;

  const NotificationTransferCard(this.notificationDTO, {super.key});

  @override
  Widget build(final BuildContext context) {
    final cardBG = notificationDTO.status == ExtrisincStatus.failed ||
            notificationDTO.status == ExtrisincStatus.error
        ? Theme.of(context).customColors.errorCardBGColor
        : null;

    return Card(
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
              _Transaction(
                fromAddress: notificationDTO.fromAddress,
                toAddress: notificationDTO.toAddress,
                amount: notificationDTO.amount,
                symbols: notificationDTO.symbols,
                blockDateTime: notificationDTO.blockDateTime,
              ),
            ],
          ),
        ),
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
      // return ListView.separated(
      //   physics: const NeverScrollableScrollPhysics(),
      //   padding: EdgeInsets.zero,
      //   shrinkWrap: true,
      //   itemCount: fromAddresses!.length,
      //   separatorBuilder: (final context, final index) => const Divider(),
      //   itemBuilder: (final context, final int index) {
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
        return const D3pBodyMediumText(
          'status_error',
        );
      case ExtrisincStatus.failed:
        return const D3pBodyMediumText(
          'status_failed',
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
