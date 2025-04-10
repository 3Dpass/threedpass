import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

class TransBytesInputField extends StatelessWidget {
  const TransBytesInputField({
    required this.controller,
    this.enabled = true,
    required this.validator,
    final Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final bool enabled;
  final String? Function(String?) validator;

  static final hexInputFormatter = TransBytesMaskTextInputFormatter();

  void onClearPressed() {
    controller.clear();
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: controller,
      labelText: 'trans_bytes_input_label'.tr(),
      suffixButton: Icons.clear,
      onSuffixButtonPressed: onClearPressed,
      // onChanged: (final value) => changeSettings(value ?? '', context),
      validator: validator,
      inputFormatters: [hexInputFormatter],
      // autofocus: true,
      enabled: enabled,
      // bottomHelpText: 'trans_help_text'.tr(),
    );
  }
}

class TransBytesMaskTextInputFormatter extends MaskTextInputFormatter {
  TransBytesMaskTextInputFormatter()
      : super(
          mask: '0x########',
          filter: {'#': RegExp(r'[0-9A-Fa-f]')},
          type: MaskAutoCompletionType.lazy,
        );
}

class TransBytesInput {
  final String rawInput;

  static final hexInputFormatter = TransBytesMaskTextInputFormatter();

  TransBytesInput(this.rawInput);

  String? get isValid {
    final realInput = hexInputFormatter.unmaskText(rawInput);

    if (int.tryParse(realInput, radix: 16) != null && realInput.length == 8) {
      return null;
    } else {
      return 'error_hex'.tr();
    }
  }

  String get unmasked => hexInputFormatter.unmaskText(rawInput);
}
