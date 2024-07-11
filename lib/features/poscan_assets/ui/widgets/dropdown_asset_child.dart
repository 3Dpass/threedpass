import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

class DropdownAssetChild extends StatelessWidget {
  const DropdownAssetChild({
    required this.value,
    super.key,
  });

  final PoscanAssetMetadata value;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FastRichText(
          mainText: value.id.toString(),
          secondaryText: 'id:',
          needSpace: true,
        ),
        const SizedBox(width: 16),
        Text(value.symbol),
      ],
    );
  }
}
