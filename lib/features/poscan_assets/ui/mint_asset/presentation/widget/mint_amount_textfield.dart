import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/bloc/mint_asset_cubit.dart';

class MintAmountTextField extends StatelessWidget {
  const MintAmountTextField({super.key});

  @override
  Widget build(final BuildContext context) {
    final smac = BlocProvider.of<MintAssetCubit>(context);
    return D3pTextFormField(
      controller: smac.amount,
      labelText: 'mint_amount_label'.tr(),
      keyboardType: TextInputType.number,
      validator: Validators.onlyBigInt,
    );
  }
}
