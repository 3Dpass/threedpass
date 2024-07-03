import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/slider/slider.dart';
import 'package:threedpass/features/asset_conversion/ui/add_liquidity/bloc/add_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/presentation/widgets/remove_liquidity_percentage_selector.dart';
import 'package:threedpass/features/asset_conversion/ui/widgets/stateful_pool_asset_choice.dart';
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
        formState: cubit,
      ),
      children: [
        ChooseAccount(
          title: 'remove_liquidity_page_choose_account_title'.tr(),
          passwordController: cubit.passwordController,
          onAccountSelected: null,
        ),
        StatefulPoolAssetChoice<RemoveLiquidityCubit, void>(
          assetNum: '1',
          onChanged: null,
          buildWhen: null,
          initialValue: cubit.asset1,
        ),
        StatefulPoolAssetChoice<RemoveLiquidityCubit, void>(
          assetNum: '2',
          onChanged: null,
          buildWhen: null,
          initialValue: cubit.asset2,
        ),
        RemoveLiquidityPercentageSelector(),
      ],
    );
  }
}
