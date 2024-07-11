import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';

class RemoveLiquidityPercentageSelector extends StatelessWidget {
  const RemoveLiquidityPercentageSelector({super.key});

  static const listOfP = [25, 50, 75, 100];

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const D3pBodyMediumText('amount_percentage_label'),
        const SizedBoxH4(),
        BlocBuilder<RemoveLiquidityCubit, RemveLiquidityState>(
          builder: (final _, final state) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              listOfP.length,
              (final index) => _RLWrapper(
                percentage: listOfP[index],
                state: state,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RLWrapper extends StatelessWidget {
  final int percentage;
  final RemveLiquidityState state;

  const _RLWrapper({
    required this.percentage,
    required this.state,
  });

  @override
  Widget build(final BuildContext context) {
    return _RLButton(
      text: '$percentage%',
      isActive: state.percentage == percentage,
      value: percentage,
      onPressed: BlocProvider.of<RemoveLiquidityCubit>(context).setPercentage,
    );
  }
}

class _RLButton extends StatelessWidget {
  const _RLButton({
    required this.text,
    required this.isActive,
    required this.onPressed,
    required this.value,
  });

  final String text;
  final bool isActive;
  final int value;
  final void Function(int) onPressed;

  @override
  Widget build(final BuildContext context) {
    return isActive
        ? D3pElevatedButton(
            text: text,
            onPressed: () => onPressed(value),
            isInfinityWidth: false,
          )
        : D3pSecondaryButton(
            localizedTextKey: text,
            onPressed: () => onPressed(value),
            isInfinityWidth: false,
            translate: false,
          );
  }
}
