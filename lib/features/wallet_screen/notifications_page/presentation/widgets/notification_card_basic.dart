import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class NotificationCardBasic extends StatelessWidget {
  const NotificationCardBasic({
    required this.message,
    required this.status,
    required this.child,
    super.key,
  });

  final ExtrinsicStatus status;
  final String? message;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final cardBG =
        status == ExtrinsicStatus.failed || status == ExtrinsicStatus.error
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
              const H4(),
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

  final ExtrinsicStatus status;

  @override
  Widget build(final BuildContext context) {
    switch (status) {
      case ExtrinsicStatus.loading:
        return Shimmer.fromColors(
          baseColor: D3pThemeData.shimmerBaseColor,
          highlightColor: D3pThemeData.shimmerHighlightColor,
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
      case ExtrinsicStatus.success:
        return D3pBodyMediumText(
          'status_success',
          color: Theme.of(context).colorScheme.primary,
        );
      case ExtrinsicStatus.error:
        return const D3pBodyMediumText(
          'status_error',
        );
      case ExtrinsicStatus.failed:
        return const D3pBodyMediumText(
          'status_failed',
        );
    }
  }
}

class _Message extends StatelessWidget {
  final String? message;
  final ExtrinsicStatus? status;

  const _Message(this.message, this.status);

  @override
  Widget build(final BuildContext context) {
    if (message != null && status != ExtrinsicStatus.success) {
      return Column(
        children: [
          D3pBodyLargeText(
            message!,
            translate: false,
          ),
          const H4(),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
