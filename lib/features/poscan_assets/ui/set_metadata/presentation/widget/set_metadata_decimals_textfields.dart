import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/bloc/set_metadata_asset_cubit.dart';

class SetMetadataDecimalslTextfield extends StatelessWidget {
  const SetMetadataDecimalslTextfield({super.key});

  @override
  Widget build(final BuildContext context) {
    final smac = BlocProvider.of<SetMetadataAssetCubit>(context);
    return D3pTextFormField(
      controller: smac.decimals,
    );
  }
}
