import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/features/common/form_option/obscure_text_field.dart';

class BasicPasswordTextField extends StatelessWidget {
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

  final TextEditingController passwordController;

  String? _passValidator(final String? v) {
    return v != null && Validators.checkPassword(v)
        ? null
        : 'create_credentials_password_error'.tr();
  }

  @override
  Widget build(BuildContext context) => ObscureTextField(
        controller: passwordController,
        bottomWidget: bottomWidget,
        labelButton: labelButton,
        onLabelButtonPressed: onLabelButtonPressed,
        validator: _passValidator,
        hint: 'enter_password_hint'.tr(),
        labelText: 'enter_password_label'.tr(),
        isLabelOutside: true,
      );
}
