import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';
import 'package:threedpass/features/accounts/presentation/widgets/advanced_options/advanced_options_listener.dart';

class MnemonicBackupAdvancedOptionsListener extends StatelessWidget {
  const MnemonicBackupAdvancedOptionsListener({
    Key? key,
    required this.child,
    required this.appService,
  }) : super(key: key);

  final Widget child;
  final AppService appService;

  void onOptionsChanged(
    BuildContext context,
    FormBlocSuccess<AccountAdvancedOptions, String> state,
    AppService appService,
  ) {
    // DefaultLoadingDialog.hide(context);
    if (state.hasSuccessResponse) {
      final bloc = BlocProvider.of<AccountStoreBloc>(context);
      bloc
        ..add(ChangeAdvancedOptions(state.successResponse!))
        ..add(GenerateMnemonicKey(appService));
      logger.i('Advanced options applied and new mnemonic generated');
    } else {
      logger.w('AdvancedOptionsFromBloc: onSuccess: '
          'hasSuccessResponse is false');
    }
  }

  @override
  Widget build(BuildContext context) => AdvancedOptionsListener(
        child: child,
        onSuccess: (context, state) =>
            onOptionsChanged(context, state, appService),
      );
}


  // void onOptionsChanged(
  //   BuildContext context,
  //   CryptoType type,
  //   String derivedPath,
  //   // FormBlocSuccess<AccountAdvancedOptions, String> state,
  //   AppService appService,
  // ) {
  //   DefaultLoadingDialog.hide(context);
  //   // if (state.hasSuccessResponse) {
  //   final bloc = BlocProvider.of<AccountStoreBloc>(context);
  //   bloc
  //     ..add(
  //       ChangeAdvancedOptions(
  //         AccountAdvancedOptions(
  //           type: type,
  //           path: derivedPath,
  //         ),
  //       ),
  //     )
  //     ..add(GenerateMnemonicKey(appService));
  //   // } else {
  //   //   logger.w('AdvancedOptionsFromBloc: onSuccess: '
  //   //       'hasSuccessResponse is false');
  //   // }
  // }