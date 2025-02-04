import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/prop_value.dart';

class PropertyMaxValueText extends StatelessWidget {
  const PropertyMaxValueText(this.propValue, {super.key});

  final PropValue propValue;

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
        children: [
          TextSpan(
            text: res.toString(),
            style: enabledStyle.copyWith(fontFeatures: <FontFeature>[
              const FontFeature.superscripts(),
            ]),
          ),
        ],
        style: enabledStyle,
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
    final textStyles = theme.textTheme;
    final enabledStyle = textStyles.bodyMedium!;
    final disabledStyle = theme.customTextStyles.fadedBodyMedium;

    return Text.rich(
      TextSpan(
        text: 'property_max_value_label'.tr(),
        children: [formattedMaxValue(propValue.maxValue, enabledStyle)],
        style: disabledStyle,
      ),
    );
  }
}
