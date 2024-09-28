import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/bloc/swap_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/swap_form.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class SwapPage extends StatelessWidget {
  const SwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final swapCubit = BlocProvider.of<SwapCubit>(context);

    return BlocBuilder<PoscanAssetsCubit, PoscanAssetsState>(
      builder: (final _, final poolsState) {
        final items = BlocProvider.of<PoscanAssetsCubit>(context).poolAssets!;
        return BlocBuilder<SwapCubit, SwapState>(
          builder: (final context, final state) {
            final isFirstTextFieldActive =
                state.chosenMethod == SwapMethod.swapExactTokensForTokens;
            return SwapForm(
              swapCubit: swapCubit,
              items: items,
              state: state,
              isFirstTextFieldActive: isFirstTextFieldActive,
            );
          },
        );
      },
    );
  }
}
