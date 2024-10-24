import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/atomic_swap/ui/create/bloc/create_swap_cubit.dart';
import 'package:threedpass/features/atomic_swap/ui/create/presentation/widgets/choose_account_create_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/ui/create/presentation/widgets/input_secret_create_atomic_swap.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_with_error.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/to_address_textfield.dart';

part './widgets/choose_deadline_create_atomic_swap.dart';
part './widgets/choose_target_create_atomic_swap.dart';
part './widgets/create_swap_submit_button.dart';

class CreateSwapPage extends StatelessWidget {
  const CreateSwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: BlocProvider.of<CreateAtomicSwapCubit>(context).formKey,
      appbarTitle: 'create_asset_page_title',
      submitButton: const _CreateSwapSubmitButton(),
      children: const [
        ChooseAccountCreateAtomicSwap(),
        _ChooseTarget(),
        InputSecretCreateAtomicSwap(),
        // CHOOSE POSCAN OR DEFAULT
        _ChooseDeadline(),
      ],
    );
  }
}
