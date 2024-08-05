import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

class SlippageTolerance extends StatelessWidget {
  const SlippageTolerance({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    super.key,
  });

  final TextEditingController? controller;
  final String? hintText;
  final void Function(String?)? onChanged;

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: (final p0) => Validators.onlyIntMax(p0, 100),
      labelText: 'slippage_tolerance_label'.tr(),
      hintText: hintText,
      onChanged: onChanged,
      suffixText: '%',
      inputFormatters: [
        PercentageTextInputFormatter(),
      ],
    );
  }
}
