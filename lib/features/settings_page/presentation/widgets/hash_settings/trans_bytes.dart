// part of '../../settings_page.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

/// Empty input means, that trans bytes should be taken from chain.
/// Else user's 8 len input will be used by calc library
class TransBytesInputField extends StatefulWidget {
  const TransBytesInputField({
    required this.controller,
    final Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TransBytesInputField> {
  static final hexInputFormatter = TransBytesMaskTextInputFormatter();

  void onClearPressed(final BuildContext context) {
    widget.controller.clear();
    // changeSettings('', context);
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: widget.controller,
      labelText: 'trans_bytes_input_label'.tr(),
      suffixButton: Icons.clear,
      onSuffixButtonPressed: () => onClearPressed(context),
      // onChanged: (final value) => changeSettings(value ?? '', context),
      validator: (final input) => TransBytesInput(input ?? '').isValid,
      inputFormatters: [hexInputFormatter],
      autofocus: true,
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

  /// Does field should show an error?
  String? get isValid {
    final realInput = hexInputFormatter.unmaskText(rawInput);
    if (realInput.isEmpty) {
      return null;
    }

    if (int.tryParse(realInput, radix: 16) != null && realInput.length == 8) {
      print('Valid $realInput');
      return null;
    } else {
      return 'error_hex'.tr();
    }
  }

  String get unmasked => hexInputFormatter.unmaskText(rawInput);
}
