import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';

class CreateAssetChooseAccount extends StatelessWidget {
  const CreateAssetChooseAccount({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<CreatePoscanAssetCubit>(context);

    return ChooseAccount(
      onAccountSelected: cubit.setAcc,
      passwordController: cubit.passwordController,
      title: 'create_asset_label_choose_account',
    );
  }
}
