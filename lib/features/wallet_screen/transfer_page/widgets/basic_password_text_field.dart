import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_textfield.dart';

class BasicPasswordTextField extends StatefulWidget {
  const BasicPasswordTextField({
    required this.passwordController,
    this.bottomWidget,
    this.labelButton,
    this.onLabelButtonPressed,
    final Key? key,
  }) : super(key: key);

  final void Function()? onLabelButtonPressed;
  final Widget? bottomWidget;
  final IconData? labelButton;

  // final bool isFirst;
  // final FromAddressData data;
  final TextEditingController passwordController;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<BasicPasswordTextField> {
  bool obscureText = true;

  String? _passValidator(final String? v) {
    return v != null && Validators.checkPassword(v)
        ? null
        : 'create_credentials_password_error'.tr();
  }

  @override
  Widget build(final BuildContext context) {
    return BasicTransferTextField(
      controller: widget.passwordController,
      hintText: 'enter_password_hint'.tr(),
      labelButton: widget.labelButton,
      labelText: 'enter_password_label'.tr(),
      maxLines: 1,
      obscureText: obscureText,
      onLabelButtonPressed: widget.onLabelButtonPressed,
      onSuffixButtonPressed: obscureTextPressed,
      suffixButton: obscureText ? Icons.visibility : Icons.visibility_off,
      validator: _passValidator,
      bottomWidget: widget.bottomWidget,
    );
  }

  void obscureTextPressed() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
