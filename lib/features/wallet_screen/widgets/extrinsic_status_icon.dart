import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';

class ExtrinsicStatusIcon extends StatelessWidget {
  final ExtrinsicStatus status;

  const ExtrinsicStatusIcon(this.status, {super.key});

  @override
  Widget build(final BuildContext context) {
    switch (status) {
      case ExtrinsicStatus.error:
        return Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
        );
      case ExtrinsicStatus.loading:
        return const D3pProgressIndicator(
          strokeWidth: 2,
          size: 24,
        );
      case ExtrinsicStatus.success:
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      case ExtrinsicStatus.failed:
        return Icon(
          Icons.close,
          color: Theme.of(context).colorScheme.error,
        );
    }
  }
}
