import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/features/accounts/bloc/mnemonic_input_cubit.dart';

class ResetMnemonicInput extends StatelessWidget {
  const ResetMnemonicInput({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: D3pTextButton(
        height: 35, // TODO Remove hardcoded sizes
        width: 100,
        text: 'Reset'.tr(),
        onPressed: () => BlocProvider.of<MnemonicInputCubit>(context).reset(),
      ),
    );
  }
}
