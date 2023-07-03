import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

class RequirementsTextField extends StatelessWidget {
  const RequirementsTextField({
    required this.controller,
    final Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  static String? onlyNumValidator(final String? value) {
    if (value != null &&
        int.tryParse(value) != null &&
        int.tryParse(value)! > 0) {
      return null;
    } else {
      return 'error_stable_is_invalid'.tr();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: controller,
      // onChanged: (final String? newValue) => _onFieldChanged(context, newValue),
      keyboardType: TextInputType.number,
      validator: onlyNumValidator,
      autofocus: true,
      // labelText: 'stable_requirement_label'.tr(),
      bottomHelpText: 'stable_requirement_help'.tr(),
    );
  }
}
