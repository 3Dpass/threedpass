import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/ui/swap_page/bloc/swap_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap_page/presentation/widgets/asset_select_card.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class SwapPage extends StatelessWidget {
  const SwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    // final items = ['ETH', 'TEST'];
    final metadata = BlocProvider.of<PoscanAssetsCubit>(context).state.metadata;
    final items = <PoolAssetField>[
      const PoolAssetField.native(),
      ...metadata.keys
          .map((final e) => PoolAssetField(assetId: e, isNative: false)),
    ];
    final swapCubit = BlocProvider.of<SwapCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swap'),
      ),
      body: Padding16(
        child: BlocBuilder<SwapCubit, SwapState>(
          builder: (final context, final state) {
            final isFirstTextFieldActive =
                state.chosenMethod == SwapMethod.swapExactTokensForTokens;
            return Column(
              children: [
                const H16(),
                AssetSelectCard(
                  initialSelectionIndex: 0,
                  items: items,
                  controller: swapCubit.firstAssetAmountController,
                  isReadOnly: !isFirstTextFieldActive,
                  onSelected: swapCubit.setFirstAsset,
                ),
                const H8(),
                D3pIconButton(
                  iconData: Icons.change_circle_outlined,
                  onPressed: () {},
                ),
                const H8(),
                AssetSelectCard(
                  initialSelectionIndex: 1,
                  items: items,
                  controller: swapCubit.firstAssetAmountController,
                  isReadOnly: isFirstTextFieldActive,
                  onSelected: swapCubit.setSecondAsset,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
