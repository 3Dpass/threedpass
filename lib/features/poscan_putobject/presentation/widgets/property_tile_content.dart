import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/paddings.dart';
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
    final textStyles = theme.textTheme;
    final enabledStyle = textStyles.bodyMedium!.copyWith(
      color: isChosen ? D3pColors.mainColor : theme.customColors.themeOpposite,
    );
    // final disabledStyle = theme.customTextStyles.fadedBodyMedium;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Checkbox.adaptive(
          // activeColor: D3pColors.mainColor,
          fillColor: MaterialStateProperty.resolveWith(
            (final states) => states.contains(MaterialState.selected)
                ? D3pColors.mainColor
                : null,
          ),
          value: isChosen,
          // fillColor: MaterialStatePropertyAll(D3pThemeData.mainColor),
          onChanged: null,
        ),
        Expanded(
          flex: 3,
          child: Text(
            prop.name,
            style: enabledStyle,
          ),
        ),
        const W8(),
        // Expanded(
        //   flex: 2,
        //   child: Text.rich(
        //     TextSpan(
        //       text: 'property_id_label'.tr(),
        //       style: disabledStyle,
        //       children: [
        //         TextSpan(
        //           text: prop.propValue.propIdx.toString(),
        //           style: enabledStyle,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        const W8(),
        Expanded(
          flex: 3,
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
