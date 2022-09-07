import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:threedpass/core/utils/empty_function.dart';

class D3pTextFormField extends StatelessWidget {
  D3pTextFormField({
    Key? key,
    TextEditingController? controller,
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
  final String? suffixButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text(labelText ?? ''),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                labelButton != null
                    ? SizedBox(
                        width: 60,
                        child: TextButton(
                          child: Text(labelButton!),
                          onPressed: onLabelButtonPressed ?? emptyFunction,
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  width: labelButton != null && suffixButton != null ? 8 : 0,
                ),
                suffixButton != null
                    ? SizedBox(
                        width: 60,
                        child: TextButton(
                          child: Text(suffixButton!),
                          onPressed: onSuffixButtonPressed ?? emptyFunction,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            hintText: hintText,
          ),
          controller: controller,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          maxLength: maxLen,
          enabled: enabled,
          validator: validator,
        ),
        bottomHelpText != null
            ? Padding(
                padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                child: Text(
                  bottomHelpText!,
                  style: Theme.of(context).textTheme.caption,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
