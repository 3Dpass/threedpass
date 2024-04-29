import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/bloc/set_metadata_asset_cubit.dart';

class SetMetadataNameTextfield extends StatelessWidget {
  const SetMetadataNameTextfield({super.key});

  @override
  Widget build(final BuildContext context) {
    final smac = BlocProvider.of<SetMetadataAssetCubit>(context);
    return D3pTextFormField(
      controller: smac.name,
      labelText: 'set_metadata_label_name'.tr(),
      validator: Validators.notEmpty,
    );
  }
}
