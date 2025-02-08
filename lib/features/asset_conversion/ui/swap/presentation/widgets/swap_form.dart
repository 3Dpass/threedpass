import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/input/d3p_switch_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/bloc/swap_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/asset_select_card.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/pools_loading_row.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/swap_info_text.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/presentation/widgets/swap_submit.dart';
import 'package:threedpass/features/asset_conversion/ui/widgets/slippage_tolerance.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';

class SwapForm extends StatelessWidget {
  const SwapForm({
    required this.swapCubit,
    required this.state,
    required this.items,
    required this.isFirstTextFieldActive,
    super.key,
  });

  final SwapCubit swapCubit;
  final SwapState state;
  final List<PoolAssetField> items;
  final bool isFirstTextFieldActive;

  @override
  Widget build(final BuildContext context) {
    return SomeForm(
      formKey: swapCubit.formKey,
      appbarTitle: 'swap_appbar_title',
      children: [
        Column(mainAxisSize: MainAxisSize.min, children: [
          const PoolsLoadingRow(),
          AssetSelectCard(
            items: items,
            controller: swapCubit.firstAssetAmountController,
            isReadOnly: !isFirstTextFieldActive,
            onSelected: swapCubit.setFirstAsset,
            chosenItem: state.firstAsset,
          ),
          const H4(),
          D3pIconButton(
            iconData: Icons.change_circle_outlined,
            onPressed: () async => swapCubit.setChosenMethod(
              state.chosenMethod == SwapMethod.swapExactTokensForTokens
                  ? SwapMethod.swapTokensForExactTokens
                  : SwapMethod.swapExactTokensForTokens,
            ),
            size: 30,
            splashRadius: 24,
          ),
          const H4(),
          AssetSelectCard(
            items: items,
            controller: swapCubit.secondAssetAmountController,
            isReadOnly: isFirstTextFieldActive,
            onSelected: swapCubit.setSecondAsset,
            chosenItem: state.secondAsset,
          ),
        ]),
        SlippageTolerance(
          controller: swapCubit.slippageToleranceController,
          hintText: '${SwapCubit.defaultSlippage}%',
          onChanged: (final p0) async => swapCubit.setSlippageTolerance(),
        ),
        const SwapInfoText(),
        ChooseAccount(
          onAccountSelected: null,
          passwordController: swapCubit.passwordController,
        ),
        D3pSwitchButton(
          value: state.keepAlive,
          onChanged: (final value) => swapCubit.setKeepAlive(value),
          text: 'keep_alive_switch_label'.tr(),
          helpText: 'transfer_keep_alive_help'.tr(),
        ),
      ],
      submitButton: const SwapSubmit(),
    );
  }
}
