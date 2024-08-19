import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class OpenBottomSheet extends StatelessWidget {
  const OpenBottomSheet({
    required this.openBottomSheet,
    required this.buttonIconData,
    required this.buttonTextChild,
    required this.unlocalizedSubtitle,
    super.key,
  });

  final void Function() openBottomSheet;
  final String unlocalizedSubtitle;
  final Widget buttonTextChild;
  final IconData buttonIconData;

  @override
  Widget build(final BuildContext context) {
    final colors = Theme.of(context).customColors;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        D3pBodyMediumText(unlocalizedSubtitle),
        const H4(),
        ClickableCard(
          padding: ClickableCard.buttonPaddingPreset,
          onTap: openBottomSheet,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonTextChild,
              Icon(
                buttonIconData,
                color: colors.themeOpposite,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
