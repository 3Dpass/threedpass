import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/choose_asset_id/choose_asset_id.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/bloc/set_metadata_asset_cubit.dart';

class SetMetadataChooseAsset extends StatelessWidget {
  const SetMetadataChooseAsset({super.key});

  @override
  Widget build(final BuildContext context) {
    final smac = BlocProvider.of<SetMetadataAssetCubit>(context);
    return ChooseAssetId(
      initialAsset: smac.initialAssetId,
      onChoose: null,
    );
  }
}
