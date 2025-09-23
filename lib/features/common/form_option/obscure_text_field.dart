import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_textfield.dart';

class ObscureTextField extends StatefulWidget {
  const ObscureTextField({
    required this.controller,
    this.bottomWidget,
    this.labelButton,
    this.onLabelButtonPressed,
    this.validator,
    this.hint,
    this.labelText,
    this.onChanged,
    this.isLabelOutside = true,
    super.key,
  });

  final void Function()? onLabelButtonPressed;
  final Widget? bottomWidget;
  final IconData? labelButton;
  final String? Function(String?)? validator;
  final String? hint;
  final String? labelText;
  final bool isLabelOutside;
  final void Function(String?)? onChanged;

  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ObscureTextField> {
  bool obscureText = true;

  @override
  Widget build(final BuildContext context) {
    return BasicTransferTextField(
      controller: widget.controller,
      hintText: widget.hint,
      labelButton: widget.labelButton,
      labelText: widget.labelText,
      maxLines: 1,
      obscureText: obscureText,
      onLabelButtonPressed: widget.onLabelButtonPressed,
      onSuffixButtonPressed: obscureTextPressed,
      suffixButton: obscureText ? Icons.visibility : Icons.visibility_off,
      validator: widget.validator,
      bottomWidget: widget.bottomWidget,
      makeLabelOutside: widget.isLabelOutside,
      onChanged: widget.onChanged,
    );
  }

  void obscureTextPressed() {
    if (mounted)
      setState(() {
        obscureText = !obscureText;
      });
  }
}
