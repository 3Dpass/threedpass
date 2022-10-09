import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:threedpass/core/utils/empty_function.dart';

part 'suffix_button.dart';
part 'bottom_help_text.dart';

class D3pTextFormField extends StatelessWidget {
  D3pTextFormField({
    final Key? key,
    final TextEditingController? controller,
    this.hintText,
    this.labelText,
    this.labelButton,
    this.onLabelButtonPressed,
    this.suffixButton,
    this.onSuffixButtonPressed,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.maxLen,
    this.bottomHelpText,
    this.enabled,
    this.obscureText,
    this.maxLines,
  })  : controller = controller ?? TextEditingController(),
        super(key: key);

  final void Function()? onLabelButtonPressed;
  final void Function()? onSuffixButtonPressed;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  /// Text to display below the input field
  final String? bottomHelpText;

  final TextEditingController controller;
  final bool? enabled;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelButton;
  final String? labelText;
  final int? maxLen;
  final int? maxLines;
  final String? suffixButton;
  final bool? obscureText;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: labelText == null ? 44 : null,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              label: Text(labelText ?? ''),
              suffixIcon: _SuffixButton(
                labelButton: labelButton,
                suffixButton: suffixButton,
                onLabelButtonPressed: onLabelButtonPressed,
                onSuffixButtonPressed: onSuffixButtonPressed,
              ).build(context),
              hintText: hintText,
            ),
            controller: controller,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            maxLength: maxLen,
            enabled: enabled,
            validator: validator,
            maxLines: maxLines,
            obscureText: obscureText ?? false,
          ),
        ),
        _BottomHelpText(bottomHelpText),
      ],
    );
  }
}
