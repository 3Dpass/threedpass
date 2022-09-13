import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/core/utils/validators.dart' as validators;

class CreateAccountForm extends StatelessWidget {
  CreateAccountForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

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

  String? _nameValidator(String? v) {
    return v != null && v.trim().isNotEmpty
        ? null
        : 'create_credentials_name_error'.tr();
  }

  String? _passValidator(String? v) {
    return v != null && validators.checkPassword(v)
        ? null
        : 'create_credentials_password_error'.tr();
  }

  String? _pass2Validator(String? v) {
    return v != null && v == _passCtrl.text
        ? null
        : 'create_credentials_password2_error'.tr();
  }

  @override
  Widget build(BuildContext context) {
    return AccountPageTemplate.create(
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameCtrl,
                decoration: InputDecoration(
                  labelText: 'create_credentials_name'.tr(),
                ),
                validator: _nameValidator,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'create_credentials_password'.tr(),
                ),
                validator: _passValidator,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _pass2Ctrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'create_credentials_password2'.tr(),
                ),
                validator: _pass2Validator,
              ),
            ],
          ),
        ),
      ],
      onSubmitPressed: (_) => onSubmit(
        formKey: _formKey,
        context: context,
        nameCtrl: _nameCtrl,
        passCtrl: _passCtrl,
      ),
    );
  }
}
