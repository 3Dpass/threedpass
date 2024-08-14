import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/input/switch_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/bloc/swap_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/asset_select_card.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/swap_info_text.dart';
import 'package:threedpass/features/asset_conversion/ui/widgets/slippage_tolerance.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_button.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class SwapPage extends StatelessWidget {
  const SwapPage({super.key});

  @override
  Widget build(final BuildContext context) {
    // TODO Refactor move to get pools assets usecase
    final poolsState = BlocProvider.of<PoolsCubit>(context).state;
    final assetsInPools = <int>{};
    poolsState.pools.forEach((final pool) {
      if (!pool.basicInfo.firstAsset.isNative) {
        assetsInPools.add(pool.basicInfo.firstAsset.assetId!);
      }

      if (!pool.basicInfo.secondAsset.isNative) {
        assetsInPools.add(pool.basicInfo.secondAsset.assetId!);
      }
    });

    final items = <PoolAssetField>[
      const PoolAssetField.native(),
      ...BlocProvider.of<PoscanAssetsCubit>(context)
          .poolAssets
          .where((final element) => assetsInPools.contains(element.assetId))
          .toList(),
    ];

    final swapCubit = BlocProvider.of<SwapCubit>(context);
    return BlocBuilder<SwapCubit, SwapState>(
      builder: (final context, final state) {
        final isFirstTextFieldActive =
            state.chosenMethod == SwapMethod.swapExactTokensForTokens;
        return SomeForm(
          formKey: swapCubit.formKey,
          appbarTitle: 'swap_appbar_title',
          submitButton: SomeFormSubmitButton(
            formState: swapCubit,
          ),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AssetSelectCard(
                  chosenItem: state.firstAsset,
                  items: items,
                  controller: swapCubit.firstAssetAmountController,
                  isReadOnly: !isFirstTextFieldActive,
                  onSelected: swapCubit.setFirstAsset,
                ),
                const H4(),
                D3pIconButton(
                  iconData: Icons.change_circle_outlined,
                  size: 30,
                  splashRadius: 24,
                  onPressed: () => swapCubit.setChosenMethod(
                    state.chosenMethod == SwapMethod.swapExactTokensForTokens
                        ? SwapMethod.swapTokensForExactTokens
                        : SwapMethod.swapExactTokensForTokens,
                  ),
                ),
                const H4(),
                AssetSelectCard(
                  chosenItem: state.secondAsset,
                  items: items,
                  controller: swapCubit.secondAssetAmountController,
                  isReadOnly: isFirstTextFieldActive,
                  onSelected: swapCubit.setSecondAsset,
                ),
              ],
            ),
            SlippageTolerance(
              controller: swapCubit.slippageToleranceController,
              hintText: '${SwapCubit.defaultSlippage}%',
              onChanged: (final p0) => swapCubit.setSlippageTolerance(),
            ),
            const SwapInfoText(),
            ChooseAccount(
              onAccountSelected: null,
              passwordController: swapCubit.passwordController,
            ),
            D3pSwitchButton(
              value: state.keepAlive,
              helpText: 'transfer_keep_alive_help'.tr(),
              onChanged: (final value) => swapCubit.setKeepAlive(value),
              text: 'keep_alive_switch_label'.tr(),
            ),
          ],
        );
      },
    );
  }
}
