import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';

class CreateAssetSubmit extends StatelessWidget {
  const CreateAssetSubmit({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      text: 'sign_extrinsic'.tr(),
      onPressed: () async => BlocProvider.of<CreatePoscanAssetCubit>(context)
          .submitExtrinsic(context),
    );
  }
}
