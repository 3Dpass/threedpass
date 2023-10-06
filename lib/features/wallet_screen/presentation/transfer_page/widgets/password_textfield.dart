import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_transfer_textfield.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    required this.passwordController,
    final Key? key,
  }) : super(key: key);

  final TextEditingController passwordController;

  String? _passValidator(final String? v) {
    return v != null && Validators.checkPassword(v)
        ? null
        : 'create_credentials_password_error'.tr();
  }

  @override
  Widget build(final BuildContext context) {
    return BasicTransferTextField(
      labelText: 'enter_password_label'.tr(),
      controller: passwordController,
      hintText: 'enter_password_hint'.tr(),
      validator: _passValidator,
      obscureText: true,
      maxLines: 1,
    );
  }
}
