import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/bloc/set_metadata_asset_cubit.dart';

class SetMetadataChooseAccount extends StatelessWidget {
  const SetMetadataChooseAccount({super.key});

  @override
  Widget build(final BuildContext context) {
    final smac = BlocProvider.of<SetMetadataAssetCubit>(context);
    return ChooseAccount(
      passwordController: smac.password,
      onAccountSelected: null,
    );
  }
}
