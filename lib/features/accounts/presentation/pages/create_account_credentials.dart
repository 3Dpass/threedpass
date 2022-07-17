import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account_page_template.dart';

class CreateAccountCredentials extends StatelessWidget {
  CreateAccountCredentials({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _pass2Ctrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  Future<void> _onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {}
    // if (_formKey.currentState.validate()) {
    //   widget.service.store.account
    //       .setNewAccount(_nameCtrl.text, _passCtrl.text);
    //   final success = await widget.onSubmit();

    //   if (success) {
    //     /// save password with biometrics after import success
    //     if (_supportBiometric && _enableBiometric) {
    //       await ImportAccountAction.authBiometric(context, widget.service);
    //     }

    //     widget.service.plugin.changeAccount(widget.service.keyring.current);
    //     widget.service.store.account.resetNewAccount();
    //     widget.service.store.account.setAccountCreated();
    //     Navigator.popUntil(context, ModalRoute.withName('/'));
    //   }
    // }
  }

  String? _nameValidator(String? v) {
    return v != null && v.trim().isNotEmpty
        ? null
        : 'create_credentials_name_error'.tr();
  }

  String? _passValidator(String? v) {
    return v != null && checkPassword(v)
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
    return CreateAccountPageTemplate(
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
                decoration: InputDecoration(
                  labelText: 'create_credentials_password'.tr(),
                ),
                validator: _passValidator,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _pass2Ctrl,
                decoration: InputDecoration(
                  labelText: 'create_credentials_password2'.tr(),
                ),
                validator: _pass2Validator,
              ),
            ],
          ),
        ),
      ],
      onSubmitPressed: _onSubmit,
    );
  }
}
