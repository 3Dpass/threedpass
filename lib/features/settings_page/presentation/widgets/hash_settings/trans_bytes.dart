// part of '../../settings_page.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

/// Empty input means, that trans bytes should be taken from chain.
/// Else user's 8 len input will be used by calc library
class TransBytesInputField extends StatelessWidget {
  const TransBytesInputField({
    required this.controller,
    required this.enabled,
    required this.validator,
    final Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final bool? enabled;
  final String? Function(String?) validator;

  static final hexInputFormatter = TransBytesMaskTextInputFormatter();

  void onClearPressed(final BuildContext context) {
    controller.clear();
    // changeSettings('', context);
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: controller,
      labelText: 'trans_bytes_input_label'.tr(),
      suffixButton: Icons.clear,
      onSuffixButtonPressed: () => onClearPressed(context),
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
      logger.t('Valid $realInput');
      return null;
    } else {
      return 'error_hex'.tr();
    }
  }

  String get unmasked => hexInputFormatter.unmaskText(rawInput);
}
