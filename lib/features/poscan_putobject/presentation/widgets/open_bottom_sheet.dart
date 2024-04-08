import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_bottom_sheet_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class OpenBottomSheet extends StatelessWidget {
  const OpenBottomSheet({
    required this.bottomSheetPlatform,
    required this.buttonIconData,
    required this.buttonTextChild,
    required this.unlocalizedSubtitle,
    super.key,
  });

  final Widget bottomSheetPlatform;
  final String unlocalizedSubtitle;
  final Widget buttonTextChild;
  final IconData buttonIconData;

  Future<dynamic> openDialog(
    final BuildContext context,
  ) {
    return showPlatformModalSheet<dynamic>(
      context: context,
      material: D3pBottonSheetTheme.materialTheme,
      builder: (final _) => Column(
        children: [
          const SizedBoxH24(),
          Flexible(
            child: bottomSheetPlatform,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final colors = Theme.of(context).customColors;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBoxH16(),
        D3pBodyMediumText(unlocalizedSubtitle),
        const SizedBoxH4(),
        ClickableCard(
          padding: ClickableCard.buttonPaddingPreset,
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
          onTap: () => openDialog(context),
        ),
      ],
    );
  }
}
