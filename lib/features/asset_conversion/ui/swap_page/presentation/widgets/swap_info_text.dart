import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/other/full_row_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/ui/swap_page/bloc/swap_cubit.dart';

// TODO Make Expected and min/max values always have the same number of digits
class SwapInfoText extends StatelessWidget {
  const SwapInfoText({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final swapCubit = BlocProvider.of<SwapCubit>(context);
    return BlocBuilder<SwapCubit, SwapState>(
      builder: (final context, final state) => SizedBox(
        height: 36,
        child: state.slippageValue == null
            ? null
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FullRowText(
                    leftText: state.chosenMethod ==
                            SwapMethod.swapExactTokensForTokens
                        ? 'swap_expected_output'
                        : 'swap_expected_input',
                    rightText: state.slippageValue != null
                        ? state.chosenMethod ==
                                SwapMethod.swapExactTokensForTokens
                            ? swapCubit.secondAssetAmountController.text
                            : swapCubit.firstAssetAmountController.text
                        : '...',
                  ),
                  const H4(),
                  FullRowText(
                    leftText: state.chosenMethod ==
                            SwapMethod.swapExactTokensForTokens
                        ? 'swap_minimum_output'
                        : 'swap_maximum_input',
                    rightText:
                        state.slippageValue?.toStringAsPrecision(4) ?? '...',
                  ),
                ],
              ),
      ),
    );
  }
}
