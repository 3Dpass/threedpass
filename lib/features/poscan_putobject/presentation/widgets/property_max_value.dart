import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/poscan_putobject/utils/max_value_validation_strategy.dart';

class PropertyMaxValueInputField extends StatelessWidget {
  static final numericInputFormatter = NumericInputFormatter();
  final TextEditingController controller;
  final MaxValueValidationStrategy validationStrategy;

  const PropertyMaxValueInputField({
    required this.controller,
    required this.validationStrategy,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 100,
      child: D3pTextFormField(
        labelText: 'max_value'.tr(),
        hintText: 'max_value'.tr(),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        controller: controller,
        validator: (final input) => validationStrategy.isValid(input ?? ''),
        inputFormatters: [numericInputFormatter],
      ),
    );
  }
}

class NumericInputFormatter extends MaskTextInputFormatter {
  NumericInputFormatter()
      : super(
          mask: '',
          filter: {"#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.lazy,
        );
}
