import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

class DropdownMetadataItem extends StatelessWidget {
  const DropdownMetadataItem({
    required this.value,
    this.prefixColor,
    this.mainColor,
    super.key,
  });

  final PoscanAssetMetadata value;
  final Color? prefixColor;
  final Color? mainColor;

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyMedium;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FastRichText(
          mainText: value.id.toString(),
          secondaryText: 'id:',
          needSpace: true,
          secondaryTextColor: prefixColor,
          mainTextColor: mainColor,
        ),
        const SizedBox(width: 16),
        Text(
          value.symbol,
          style:
              mainColor != null ? medium!.copyWith(color: mainColor) : medium,
        ),
      ],
    );
  }
}
