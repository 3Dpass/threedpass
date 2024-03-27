import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/poscan_putobject/bloc/poscan_putobject_cubit.dart';

class PutObjectChooseAccount extends StatelessWidget {
  const PutObjectChooseAccount({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<PoscanPutObjectCubit>(context);

    return ChooseAccount(
      onAccountSelected: cubit.setAcc,
      passwordController: cubit.accountPassword,
      initial: cubit.state.account,
    );
  }
}
