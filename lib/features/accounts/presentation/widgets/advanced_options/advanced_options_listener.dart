import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/accounts/bloc/advanced_options_from_bloc.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';

class AdvancedOptionsListener extends StatelessWidget {
  const AdvancedOptionsListener({
    Key? key,
    required this.child,
    required this.onSuccess,
  }) : super(key: key);

  final Widget child;
  final void Function(
    BuildContext,
    FormBlocSuccess<AccountAdvancedOptions, String>,
  ) onSuccess;

  // final void Function(BuildContext, CryptoType, String) onValidated;

  @override
  Widget build(BuildContext context) =>
      FormBlocListener<AdvancedOptionsFromBloc, AccountAdvancedOptions, String>(
        onSubmitting: (context, state) {
          print('ON SUBMITTING ${state.runtimeType}');
          // DefaultLoadingDialog.show(context);
          final path =
              state.valueOf<String>(AdvancedOptionsFromBloc.derivePathName);
          final crypto =
              state.valueOf<CryptoType>(AdvancedOptionsFromBloc.cryptoTypeName);

          // state.toLoaded();
          final formBloc = context.read<AdvancedOptionsFromBloc>();
          // formBloc.submit();
          if (formBloc.state.isValid()) {
            // formBloc.submit();
            formBloc.emitSuccess(
              successResponse: AccountAdvancedOptions(
                type: crypto ?? defaultCryptoType,
                path: path ?? '',
              ),
            );
          } else {
            formBloc.emitFailure();
          }
        },
        onSuccess: onSuccess,
        child: child,
      );
}
