import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/bloc/mint_asset_cubit.dart';

class MintChooseAccount extends StatelessWidget {
  const MintChooseAccount({super.key});

  @override
  Widget build(final BuildContext context) {
    final smac = BlocProvider.of<MintAssetCubit>(context);
    return ChooseAccount(
      passwordController: smac.password,
      onAccountSelected: null,
    );
  }
}
