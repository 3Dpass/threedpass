import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account_page_template.dart';

class CreateAccountCredentials extends StatelessWidget {
  CreateAccountCredentials({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _pass2Ctrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  Future<void> _onSubmit(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      // set aacount data
      BlocProvider.of<AccountStoreBloc>(context).add(
        SetCredentials(name: _nameCtrl.text, password: _passCtrl.text),
      );
      // TODO The code below dublicatates event above. Bad pattern :(
      final account = BlocProvider.of<AccountStoreBloc>(context)
          .state
          .newAccount
          .copyWith(name: _nameCtrl.text, password: _passCtrl.text);

      try {
        final json = await BlocProvider.of<AppServiceLoaderCubit>(context)
            .importAccount(account: account);

        BlocProvider.of<AppServiceLoaderCubit>(context)
            .addAccount(json: json, account: account);

        // apply current account
        BlocProvider.of<AppServiceLoaderCubit>(context)
            .setPluginAccountToKeyringCurrent();
      } catch (e) {
        logger.e(
          'ERROR: Could not create account $e',
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Critical error! Your account data was saved, but authorization did NOT happen. Please try again.',
            ),
          ),
        );
      }

      // reset create form
      BlocProvider.of<AccountStoreBloc>(context).add(
        const ResetAccount(),
      );

      BlocProvider.of<AccountStoreBloc>(context).add(
        const PopToRoout(),
      );
    }
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
      onSubmitPressed: () => _onSubmit(context),
    );
  }
}
