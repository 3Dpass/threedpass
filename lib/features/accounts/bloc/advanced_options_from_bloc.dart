import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';

class AdvancedOptionsFromBloc extends FormBloc<AccountAdvancedOptions, String> {
  AdvancedOptionsFromBloc({
    required this.appService,
    required this.mnemonic,
  }) {
    addFieldBlocs(fieldBlocs: [cryptoType, derivePath]);

    derivePath.addAsyncValidators(
      [_checkDerivePath],
    );

    derivePath.stream.listen((event) {
      print('derivePath state listener ${event.runtimeType}');
      event.isValid ? emitSubmitting() : null;
    });
  }

  static const cryptoTypeName = 'Crypto type';
  static const derivePathName = 'Derive path';

  final AppService appService;
  final cryptoType = SelectFieldBloc(
    name: cryptoTypeName,
    initialValue: defaultCryptoType,
    items: CryptoType.values,
  );

  final derivePath = TextFieldBloc(
    name: derivePathName,
    initialValue: '',
    asyncValidatorDebounceTime: const Duration(milliseconds: 500),
  );

  final String mnemonic;

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

  void resetForm() {
    cryptoType.updateValue(defaultCryptoType);
    derivePath.updateValue('');
  }

  Future<String?> _checkDerivePath(String? path) async {
    // Empty path is valid
    if (path == null || path.isEmpty) {
      // emitSubmitting();
      return null;
    }

    // if (!path.startsWith('/')) {
    //   return 'Invalid derive path';
    // }

    return appService.plugin.sdk.api.keyring.checkDerivePath(
      mnemonic,
      path,
      cryptoType.value ?? defaultCryptoType,
    );
  }
}
