import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';

class RemoveLiquidityPercentageSelector extends StatelessWidget {
  const RemoveLiquidityPercentageSelector({super.key});

  static const listOfP = [25, 50, 75];

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const D3pBodyMediumText('amount_percentage_label'),
        const H4(),
        BlocBuilder<RemoveLiquidityCubit, RemoveLiquidityState>(
          buildWhen: (final previous, final current) =>
              previous.percentage != current.percentage ||
              previous.maxPercent != current.maxPercent ||
              previous.isMaxChosen != current.isMaxChosen,
          builder: (final _, final state) {
            final buttons = List.generate(
              listOfP.length,
              (final index) => _RLWrapper(
                percentage: listOfP[index],
                enabled: state.maxPercent != null &&
                    listOfP[index] <= state.maxPercent!,
                isActive:
                    !state.isMaxChosen && state.percentage == listOfP[index],
              ),
            );
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...buttons,
                _RLButton(
                  text: 'max',
                  isActive: state.isMaxChosen,
                  onPressed: state.maxPercent != null
                      ? () => BlocProvider.of<RemoveLiquidityCubit>(context)
                          .setPercentage(state.maxPercent!, true)
                      : null,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _RLWrapper extends StatelessWidget {
  final int percentage;
  final bool isActive;
  final bool enabled;

  const _RLWrapper({
    required this.percentage,
    required this.isActive,
    required this.enabled,
  });

  @override
  Widget build(final BuildContext context) {
    return _RLButton(
      text: '$percentage%',
      isActive: isActive,
      onPressed: enabled
          ? () => BlocProvider.of<RemoveLiquidityCubit>(context)
              .setPercentage(percentage, false)
          : null,
    );
  }
}

class _RLButton extends StatelessWidget {
  const _RLButton({
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  final String text;
  final bool isActive;
  final void Function()? onPressed;

  @override
  Widget build(final BuildContext context) {
    return isActive
        ? D3pElevatedButton(
            text: text,
            isInfinityWidth: false,
            onPressed: onPressed,
          )
        : D3pSecondaryButton(
            localizedTextKey: text,
            isInfinityWidth: false,
            translate: false,
            onPressed: onPressed,
          );
  }
}
