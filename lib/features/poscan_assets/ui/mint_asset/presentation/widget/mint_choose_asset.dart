import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/choose_asset_id/choose_asset_id.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/bloc/mint_asset_cubit.dart';

class MintChooseAsset extends StatelessWidget {
  const MintChooseAsset({super.key});

  @override
  Widget build(final BuildContext context) {
    final smac = BlocProvider.of<MintAssetCubit>(context);
    return ChooseAssetId(
      initialAsset: smac.initialAsset,
      onChoose: null,
    );
  }
}
