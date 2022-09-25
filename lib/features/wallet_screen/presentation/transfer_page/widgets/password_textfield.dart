part of '../transfer_page.dart';

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  String? _passValidator(String? v) {
    return v != null && checkPassword(v)
        ? null
        : 'create_credentials_password_error'.tr();
  }

  @override
  Widget build(BuildContext context) {
    return D3pTextFormField(
      labelText: 'enter_password_label'.tr(),
      controller: passwordController,
      hintText: 'enter_password_hint'.tr(),
      validator: _passValidator,
      obscureText: true,
      maxLines: 1,
      // hintText: 'amount_hint'.tr(),
    );
  }
}
