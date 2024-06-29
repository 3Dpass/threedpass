import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/asset_conversion/ui/add_liquidity/bloc/add_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/widgets/stateful_pool_asset_choice.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_button.dart';

class AddLiquidityPage extends StatelessWidget {
  const AddLiquidityPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<AddLiquidityCubit>(context);

    return SomeForm(
      formKey: cubit.formKey,
      appbarTitle: 'add_liquidity_page_title',
      submitButton: SomeFormSubmitButton(
        formState: cubit,
      ),
      children: [
        ChooseAccount(
          title: 'add_liquidity_page_choose_account_title'.tr(),
          passwordController: cubit.passwordController,
          onAccountSelected: null,
        ),
        StatefulPoolAssetChoice<AddLiquidityCubit, void>(
          assetNum: '1',
          onChanged: null,
          buildWhen: null,
          initialValue: cubit.asset1,
        ),
        StatefulPoolAssetChoice<AddLiquidityCubit, void>(
          assetNum: '2',
          onChanged: null,
          buildWhen: null,
          initialValue: cubit.asset2,
        ),
        D3pTextFormField(
          labelText: 'add_liquidity_page_amount_1_desired_label'.tr(),
          controller: cubit.amount1Desired,
          validator: Validators.onlyBigInt,
        ),
        D3pTextFormField(
          labelText: 'add_liquidity_page_amount_2_desired_label'.tr(),
          controller: cubit.amount2Desired,
          validator: Validators.onlyBigInt,
        ),
        D3pTextFormField(
          labelText: 'add_liquidity_page_amount_1_min_label'.tr(),
          controller: cubit.amount1Min,
          validator: Validators.onlyBigInt,
        ),
        D3pTextFormField(
          labelText: 'add_liquidity_page_amount_2_min_label'.tr(),
          controller: cubit.amount2Min,
          validator: Validators.onlyBigInt,
        ),
      ],
    );
  }
}
