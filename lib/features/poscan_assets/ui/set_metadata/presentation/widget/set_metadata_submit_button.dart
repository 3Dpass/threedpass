import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/bloc/set_metadata_asset_cubit.dart';

class SetMetadataSubmitButton extends StatelessWidget {
  const SetMetadataSubmitButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      text: 'LOCALIZE',
      onPressed: () =>
          BlocProvider.of<SetMetadataAssetCubit>(context).submitExtrinsic(),
    );
  }
}
