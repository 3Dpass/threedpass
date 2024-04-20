import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';

class CreateAssetInputId extends StatelessWidget {
  const CreateAssetInputId({super.key});

  @override
  Widget build(final BuildContext context) {
    final cpac = BlocProvider.of<CreatePoscanAssetCubit>(context);
    return D3pTextFormField(
      labelText: 'create_account_label_asset_id'.tr(),
      validator: Validators.onlyInt,
      controller: cpac.assetId,
    );
  }
}
