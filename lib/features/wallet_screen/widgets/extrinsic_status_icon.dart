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
        return const Icon(
          Icons.error_outline,
          color: Colors.red,
        );
      case ExtrinsicStatus.loading:
        return const SizedBox(
          width: 24,
          height: 24,
          child: D3pProgressIndicator(
            strokeWidth: 2,
          ),
        );
      case ExtrinsicStatus.success:
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      case ExtrinsicStatus.failed:
        return const Icon(
          Icons.close,
          color: Colors.red,
        );
    }
  }
}
