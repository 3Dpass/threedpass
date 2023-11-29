import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/preview_page/domain/poscan_property.dart';

class PropertyTileText extends StatelessWidget {
  const PropertyTileText({
    required this.prop,
    super.key,
  });

  final PoscanProperty prop;

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;
    final enabledStyle = textStyles.d3pBodyMedium;
    final disabledStyle =
        textStyles.d3pBodyMedium.copyWith(color: D3pColors.disabled);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            prop.name,
            style: enabledStyle,
          ),
        ),
        Expanded(
          flex: 1,
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
          flex: 3,
          child: Text.rich(
            TextSpan(
              text: ' max_value: ',
              style: disabledStyle,
              children: [
                TextSpan(
                  text: prop.propValue.maxValue.toString(),
                  style: enabledStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
    return Text.rich(
      TextSpan(
        text: prop.name,
        style: enabledStyle,
        children: [
          TextSpan(
            text: ' id: ',
            style: disabledStyle,
          ),
          TextSpan(
            text: prop.propValue.propIdx.toString(),
            style: enabledStyle,
          ),
          TextSpan(
            style: disabledStyle,
          ),
          TextSpan(
            text: prop.propValue.maxValue.toString(),
            style: enabledStyle,
          ),
        ],
      ),
    );
    // return '${fixedName()}${shortAddress()}';
  }
}
