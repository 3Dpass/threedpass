import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/features/poscan_putobject/domain/entities/poscan_property.dart';

class EditPropertyButton extends StatelessWidget {
  final PoscanProperty prop;
  Function(BuildContext, PoscanProperty) onPressedEditCallback;

  EditPropertyButton(
      {required this.prop, required this.onPressedEditCallback, super.key});

  @override
  Widget build(final BuildContext context) {
    if (prop.propValue.propIdx != 0) {
      return IconButton(
        icon: const Icon(
          Icons.edit,
          size: 18,
          color: D3pColors.disabled,
        ),
        onPressed: () => onPressedEditCallback(context, prop),
      );
    } else {
      return Container();
    }
  }
}
