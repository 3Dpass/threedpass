import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/other/full_row_text.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';

class RemoveLiquidityInfoSection extends StatelessWidget {
  const RemoveLiquidityInfoSection({super.key});

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 100,
      child: BlocBuilder<RemoveLiquidityCubit, RemveLiquidityState>(
        builder: (final context, final state) {
          if (state.isLoading || state.removeLiquidityInfo == null) {
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // CurrencyText(asset1Amount: ,),
              // FullRowText(
              //   leftText: 'Price impact',
              // ),
              FullRowText(
                leftText: 'Expected output',
                rightText: state.removeLiquidityInfo!.amount1Expected
                    .toDouble()
                    .toString(),
              ),
              FullRowText(
                leftText: 'Minimum output',
                rightText: state.removeLiquidityInfo!.amount1MinRecieve
                    .toDouble()
                    .toString(),
              ),
              FullRowText(
                leftText: 'Expected output',
                rightText: state.removeLiquidityInfo!.amount2Expected
                    .toDouble()
                    .toString(),
              ),
              FullRowText(
                leftText: 'Minimum output',
                rightText: state.removeLiquidityInfo!.amount2MinRecieve
                    .toDouble()
                    .toString(),
              ),
            ],
          );
        },
      ),
    );
  }
}
