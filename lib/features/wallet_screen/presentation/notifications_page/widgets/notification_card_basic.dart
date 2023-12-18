import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';

class NotificationCardBasic extends StatelessWidget {
  const NotificationCardBasic({
    required this.message,
    required this.status,
    required this.child,
    super.key,
  });

  final ExtrisincStatus status;
  final String? message;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final cardBG =
        status == ExtrisincStatus.failed || status == ExtrisincStatus.error
            ? Theme.of(context).customColors.errorCardBGColor
            : null;

    return Card(
      color: cardBG,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const D3pBodyMediumText('extrinsic_status'),
                  const SizedBox(width: 8),
                  _TransferStatus(status),
                ],
              ),
              const SizedBoxH4(),
              _Message(message, status),
              child,
            ],
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
