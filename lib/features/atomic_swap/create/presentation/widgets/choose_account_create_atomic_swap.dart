import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/atomic_swap/create/bloc/create_atomic_swap_cubit.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';

class ChooseAccountCreateAtomicSwap extends StatelessWidget {
  const ChooseAccountCreateAtomicSwap({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<CreateAtomicSwapCubit>(context);

    return ChooseAccount(
      onAccountSelected: null,
      passwordController: cubit.passwordController,
      title: 'create_atomic_swap_choose_account_label',
    );
  }
}
