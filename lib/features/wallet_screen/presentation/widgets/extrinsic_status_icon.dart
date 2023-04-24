import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/progress_indicator/thin_progress_indicator.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';

class ExtrinsicStatusIcon extends StatelessWidget {
  final ExtrisincStatus status;

  const ExtrinsicStatusIcon(this.status, {super.key});

  @override
  Widget build(final BuildContext context) {
    switch (status) {
      case ExtrisincStatus.error:
        return const Icon(
          Icons.error_outline,
          color: Colors.red,
        );
      case ExtrisincStatus.loading:
        return const SizedBox(
          width: 24,
          height: 24,
          child: ThinProgressIndicator(),
        );
      case ExtrisincStatus.success:
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      case ExtrisincStatus.fail:
        return const Icon(
          Icons.close,
          color: Colors.red,
        );
    }
  }
}
