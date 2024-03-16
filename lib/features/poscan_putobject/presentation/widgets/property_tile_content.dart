import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/edit_property_button.dart';

class PropertyTileContent extends StatelessWidget {
  final PoscanProperty prop;
  final bool isChosen;
  final void Function(BuildContext, PoscanProperty) onPressedEditCallback;

  const PropertyTileContent({
    required this.prop,
    required this.isChosen,
    required this.onPressedEditCallback,
    super.key,
  });

  TextSpan formattedMaxValue(
    final BigInt maxValue,
    final TextStyle enabledStyle,
  ) {
    if (maxValue == BigInt.from(1) || maxValue == BigInt.from(10)) {
      return TextSpan(
        text: maxValue.toString(),
        style: enabledStyle,
      );
    }
    final str = maxValue.toString();
    final correctNumPattern = RegExp(r'^1[0]*');
    final matches = correctNumPattern.allMatches(str);

    if (matches.length == 1 && matches.first.group(0) == str) {
      int res = 1;
      final big10 = BigInt.from(10);
      BigInt tmp = maxValue;
      while (tmp > big10) {
        tmp = tmp ~/ big10;
        res++;
      }
      return TextSpan(
        text: '10^',
        style: enabledStyle,
        children: [
          TextSpan(
            text: res.toString(),
            style: enabledStyle.copyWith(
              fontFeatures: <FontFeature>[
                const FontFeature.superscripts(),
              ],
            ),
          ),
        ],
      );
    } else {
      return TextSpan(
        text: maxValue.toString(),
        style: enabledStyle,
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.customTextStyles;
    final enabledStyle = textStyles.d3pBodyMedium.copyWith(
      color:
          isChosen ? D3pThemeData.mainColor : theme.customColors.themeOpposite,
    );
    final disabledStyle =
        textStyles.d3pBodyMedium.copyWith(color: D3pColors.disabled);

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Checkbox(
            value: isChosen,
            fillColor: MaterialStatePropertyAll(D3pThemeData.mainColor),
            onChanged: null,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            prop.name,
            style: enabledStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text.rich(
            TextSpan(
              text: ' id: ',
              style: disabledStyle,
              children: [
                TextSpan(
                  text: prop.propValue.propIdx.toString(),
                  style: enabledStyle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text.rich(
            TextSpan(
              text: ' max value: ',
              style: disabledStyle,
              children: [
                formattedMaxValue(prop.propValue.maxValue, enabledStyle),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: EditPropertyButton(
            prop: prop,
            onPressedEditCallback: onPressedEditCallback,
          ),
        ),
      ],
    );
  }
}
