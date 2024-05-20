import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';

class PoscanAssetTransferFloatingButton extends StatelessWidget {
  const PoscanAssetTransferFloatingButton({required this.enabled, super.key});

  final bool enabled;

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton(
      backgroundColor: enabled ? null : D3pColors.disabled,
      onPressed: enabled ? () {} : null,
      child: const Icon(Icons.arrow_upward_rounded),
    );
  }
}
