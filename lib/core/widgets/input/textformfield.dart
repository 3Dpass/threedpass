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
  })  : controller = controller ?? TextEditingController(),
        super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? labelButton;
  final void Function()? onLabelButtonPressed;
  final String? suffixButton;
  final void Function()? onSuffixButtonPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(labelText ?? ''),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            labelButton != null
                ? TextButton(
                    child: Text(labelButton!),
                    onPressed: onLabelButtonPressed ?? emptyFunction,
                  )
                : const SizedBox(),
            const SizedBox(width: 8),
            suffixButton != null
                ? TextButton(
                    child: Text(suffixButton!),
                    onPressed: onSuffixButtonPressed ?? emptyFunction,
                  )
                : const SizedBox(),
          ],
        ),
        hintText: hintText,
      ),
      controller: controller,
    );
  }
}
