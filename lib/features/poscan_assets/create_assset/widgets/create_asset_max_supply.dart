import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/poscan_assets/create_assset/bloc/create_poscan_asset_cubit.dart';

class CreateAssetMaxSupply extends StatelessWidget {
  const CreateAssetMaxSupply({super.key});

  @override
  Widget build(final BuildContext context) {
    final cpac = BlocProvider.of<CreatePoscanAssetCubit>(context);
    return D3pTextFormField(
      labelText: 'Max supply',
      validator: Validators.onlyBigInt,
      controller: cpac.maxSupply,
    );
  }
}
