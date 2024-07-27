import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';

class CreateAccountForm extends StatelessWidget {
  CreateAccountForm({
    required this.onSubmit,
    required this.appbarText,
    final Key? key,
  }) : super(key: key);

  final String appbarText;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _pass2Ctrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  final void Function({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameCtrl,
    required TextEditingController passCtrl,
  }) onSubmit;

  String? _nameValidator(final String? v) {
    return v != null && v.trim().isNotEmpty
        ? null
        : 'create_credentials_name_error'.tr();
  }

  String? _passValidator(final String? v) {
    return v != null && Validators.checkPassword(v)
        ? null
        : 'create_credentials_password_error'.tr();
  }

  String? _pass2Validator(final String? v) {
    return v != null && v == _passCtrl.text
        ? null
        : 'create_credentials_password2_error'.tr();
  }

  @override
  Widget build(final BuildContext context) {
    return AccountPageTemplate(
      appbarTitle: appbarText,
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const H16(),
              D3pTextFormField(
                labelText: 'create_credentials_name'.tr(),
                controller: _nameCtrl,
                validator: _nameValidator,
              ),
              const H16(),
              D3pTextFormField(
                labelText: 'create_credentials_password'.tr(),
                controller: _passCtrl,
                obscureText: true,
                validator: _passValidator,
              ),
              const H16(),
              D3pTextFormField(
                labelText: 'create_credentials_password2'.tr(),
                controller: _pass2Ctrl,
                obscureText: true,
                validator: _pass2Validator,
              ),
            ],
          ),
        ),
      ],
      onSubmitPressed: (final _) => onSubmit(
        formKey: _formKey,
        context: context,
        nameCtrl: _nameCtrl,
        passCtrl: _passCtrl,
      ),
    );
  }
}
