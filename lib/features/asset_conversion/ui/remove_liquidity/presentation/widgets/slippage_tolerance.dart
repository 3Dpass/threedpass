import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';

class SlippageTolerance extends StatelessWidget {
  const SlippageTolerance({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller:
          BlocProvider.of<RemoveLiquidityCubit>(context).slippageTolerance,
      keyboardType: TextInputType.number,
      validator: (final p0) => Validators.onlyIntMax(p0, 100),
      labelText: 'slippage_tolerance_label'.tr(),
      hintText: '${RemoveLiquidityCubit.defaultSlippage}%',
      suffixText: '%',
      inputFormatters: [
        PercentageTextInputFormatter(),
      ],
    );
  }
}
