import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/bloc/swap_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/swap_form.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class SwapPage extends StatelessWidget {
  const SwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final swapCubit = BlocProvider.of<SwapCubit>(context);
    return BlocBuilder<PoolsCubit, PoolsState>(
      builder: (final _, final poolsState) {
        final assetsInPools = <int>{};
        poolsState.value!.pools.forEach((final pool) {
          if (!pool.basicInfo.firstAsset.isNative) {
            assetsInPools.add(pool.basicInfo.firstAsset.assetId!);
          }

          if (!pool.basicInfo.secondAsset.isNative) {
            assetsInPools.add(pool.basicInfo.secondAsset.assetId!);
          }
        });

        final items = <PoolAssetField>[
          const PoolAssetField.native(),
          ...BlocProvider.of<PoscanAssetsCubit>(context).poolAssets!.where(
                (final element) => assetsInPools.contains(element.assetId),
              ),
        ];

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
