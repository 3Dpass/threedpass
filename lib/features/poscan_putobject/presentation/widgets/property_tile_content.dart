import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/edit_property_button.dart';
import 'package:threedpass/features/poscan_putobject/presentation/widgets/property_max_value_text.dart';

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
        SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: Text.rich(
            TextSpan(
              text: 'property_id_label'.tr(),
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
        SizedBox(width: 8),
        Expanded(
          flex: 4,
          child: PropertyMaxValueText(prop.propValue),
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
