import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';

class RemoveLiquidityCustomPercentage extends StatelessWidget {
  const RemoveLiquidityCustomPercentage({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<RemoveLiquidityCubit>(context);

    return BlocBuilder<RemoveLiquidityCubit, RemoveLiquidityState>(
      builder: (final _, final state) => D3pTextFormField(
        enabled: state.maxPercent != null,
        controller: cubit.customPercentage,
        keyboardType: TextInputType.number,
        validator: (final p0) =>
            Validators.onlyIntMax(p0, state.maxPercent ?? 100),
        labelText: 'remove_liquidity_custom_percentage'.tr(),
        hintText: RemoveLiquidityState.initial().percentage.toString(),
        onChanged: (final p0) => int.tryParse(p0 ?? '') != null
            ? cubit.setPercentage(int.parse(p0!), false)
            : null,
        suffixText: '%',
        inputFormatters: [
          PercentageTextInputFormatter(),
        ],
      ),
    );
  }
}
