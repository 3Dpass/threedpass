import 'package:flutter/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_cubit.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';
import 'package:threedpass/features/accounts/presentation/widgets/advanced_options/advanced_options_input.dart';
import 'package:threedpass/features/accounts/presentation/widgets/advanced_options/advanced_options_listener.dart';

class ImportMnemonicAdvancedOptions extends StatelessWidget {
  const ImportMnemonicAdvancedOptions({Key? key}) : super(key: key);

  void onOptionsChanged(
    BuildContext context,
    FormBlocSuccess<AccountAdvancedOptions, String> state,
  ) {
    DefaultLoadingDialog.hide(context);
    BlocProvider.of<ImportAccountCubit>(context)
        .changeOptions(state.successResponse!);
  }

  @override
  Widget build(BuildContext context) {
    print('build2');
    // return AdvancedOptionsListener(
    //   child: AdvancedOptionsInput(),
    //   onSuccess: onOptionsChanged,
    // );
    return SizedBox();
  }
}
