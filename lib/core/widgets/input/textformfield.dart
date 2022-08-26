import 'package:flutter/material.dart';
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
  })  : controller = controller ?? TextEditingController(),
        super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? labelButton;
  final void Function()? onLabelButtonPressed;
  final String? suffixButton;
  final void Function()? onSuffixButtonPressed;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
    );
  }
}
