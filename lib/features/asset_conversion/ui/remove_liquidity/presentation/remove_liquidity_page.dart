import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/presentation/widgets/remove_liquidity_custom_percentage.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/presentation/widgets/remove_liquidity_info_section.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/presentation/widgets/remove_liquidity_percentage_selector.dart';
import 'package:threedpass/features/asset_conversion/ui/widgets/slippage_tolerance.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_button.dart';

class RemoveLiquidityPage extends StatelessWidget {
  const RemoveLiquidityPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<RemoveLiquidityCubit>(context);

    return SomeForm(
      formKey: cubit.formKey,
      appbarTitle: 'remove_liquidity_page_title',
      submitButton: SomeFormSubmitButton(
        extrinsicMixin: cubit,
      ),
      children: [
        ChooseAccount(
          title: 'remove_liquidity_page_choose_account_title',
          passwordController: cubit.passwordController,
          onAccountSelected: null,
        ),
        const RemoveLiquidityPercentageSelector(),
        const RemoveLiquidityCustomPercentage(),
        SlippageTolerance(
          controller: cubit.slippageTolerance,
          hintText: '${RemoveLiquidityCubit.defaultSlippage}%',
          onChanged: (final p0) => cubit.setSlippageTolerance(),
        ),
        const RemoveLiquidityInfoSection(),
      ],
    );
  }
}
