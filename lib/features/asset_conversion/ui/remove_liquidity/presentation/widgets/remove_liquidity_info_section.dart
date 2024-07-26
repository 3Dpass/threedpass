import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/safe_native_symbol.dart';
import 'package:threedpass/core/widgets/other/fast_separated_listview.dart';
import 'package:threedpass/core/widgets/other/full_row_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';

class RemoveLiquidityInfoSection extends StatelessWidget {
  const RemoveLiquidityInfoSection({super.key});

  @override
  Widget build(final BuildContext context) {
    final rlc = BlocProvider.of<RemoveLiquidityCubit>(context);
    final nativeSymbols = BlocProvider.of<AppServiceLoaderCubit>(context)
            .state
            .networkStateData
            .safeNativeSymbol ??
        '';
    final asset1Symbol = rlc.poolFullInfo.asset1Meta?.symbol ?? nativeSymbols;
    final asset2Symbol = rlc.poolFullInfo.asset2Meta?.symbol ?? nativeSymbols;
    return SizedBox(
      height: 88,
      child: BlocBuilder<RemoveLiquidityCubit, RemoveLiquidityState>(
        builder: (final context, final state) {
          if (state.isLoading || state.removeLiquidityInfo == null) {
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          }

          final children = [
            // CurrencyText(asset1Amount: ,),
            // FullRowText(
            //   leftText: 'Price impact',
            // ),
            FullRowText(
              leftText: 'Expected output $asset1Symbol',
              rightText: state.removeLiquidityInfo!.amount1Expected
                  .toDouble()
                  .toStringAsPrecision(4),
            ),
            FullRowText(
              leftText: 'Minimum output $asset1Symbol',
              rightText: state.removeLiquidityInfo!.amount1MinRecieve
                  .toDouble()
                  .toStringAsPrecision(4),
            ),
            FullRowText(
              leftText: 'Expected output $asset2Symbol',
              rightText: state.removeLiquidityInfo!.amount2Expected
                  .toDouble()
                  .toStringAsPrecision(4),
            ),
            FullRowText(
              leftText: 'Minimum output $asset2Symbol', // TODO Localize
              rightText: state.removeLiquidityInfo!.amount2MinRecieve
                  .toDouble()
                  .toStringAsPrecision(4),
            ),
          ];

          return FastSeparatedListView(
            separator: const SizedBoxH8(),
            children: children,
          );
        },
      ),
    );
  }
}
