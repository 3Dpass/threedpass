import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/accounts/bloc/mnemonic_input_cubit.dart';

class ResetMnemonicInput extends StatelessWidget {
  const ResetMnemonicInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => BlocProvider.of<MnemonicInputCubit>(context).reset(),
      child: Text(
        'Reset'.tr(),
      ),
    );
  }
}
