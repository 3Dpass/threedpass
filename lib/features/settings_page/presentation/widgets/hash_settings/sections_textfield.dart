import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

class SectionsTextField extends StatelessWidget {
  const SectionsTextField({required this.controller, final Key? key})
      : super(key: key);

  final TextEditingController controller;

  static String? onlyNumValidator(final String? value) {
    if (value != null && int.tryParse(value) != null) {
      return null;
    } else {
      return 'error_n_sections_validator'.tr();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: controller,
      // onChanged: (final String? newValue) => _onFieldChanged(context, newValue),
      keyboardType: TextInputType.number,
      validator: onlyNumValidator,
      labelText: 'n_sections_label'.tr(),
      bottomHelpText: 'n_sections_help'.tr(),
    );
  }
}
