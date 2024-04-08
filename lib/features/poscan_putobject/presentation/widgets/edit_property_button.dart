import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';

class EditPropertyButton extends StatelessWidget {
  final PoscanProperty prop;
  final void Function(BuildContext, PoscanProperty) onPressedEditCallback;

  const EditPropertyButton({
    required this.prop,
    required this.onPressedEditCallback,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    if (prop.propValue.propIdx != 0) {
      return D3pIconButton(
        iconData: Icons.edit,
        size: 18,
        iconColor: D3pColors.disabled,
        onPressed: () => onPressedEditCallback(context, prop),
        emptyContraints: true,
      );
    } else {
      return const SizedBox();
    }
  }
}
