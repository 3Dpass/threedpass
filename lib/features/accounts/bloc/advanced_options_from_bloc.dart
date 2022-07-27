import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';

class AdvancedOptionsFromBloc extends FormBloc<AccountAdvancedOptions, String> {
  final cryptoType = SelectFieldBloc(
    initialValue: defaultCryptoType,
    items: CryptoType.values,
  );

  final derivePath = TextFieldBloc(
    initialValue: '',
    asyncValidatorDebounceTime: const Duration(milliseconds: 500),
  );

  final AppService appService;
  final String mnemonic;

  AdvancedOptionsFromBloc({
    required this.appService,
    required this.mnemonic,
  }) {
    addFieldBlocs(fieldBlocs: [cryptoType, derivePath]);

    derivePath.addAsyncValidators(
      [_checkDerivePath],
    );
  }

  Future<String?> _checkDerivePath(String? path) async {
    // Empty path is valid
    if (path == null || path.isEmpty) {
      return null;
    }

    return appService.plugin.sdk.api.keyring.checkDerivePath(
      mnemonic,
      path,
      cryptoType.value ?? defaultCryptoType,
    );
  }

  @override
  void onSubmitting() async {
    try {
      emitSuccess(
        successResponse: AccountAdvancedOptions(
          type: cryptoType.value ?? defaultCryptoType,
          path: derivePath.value,
        ),
      );
    } catch (e) {
      emitFailure();
    }
  }
}
