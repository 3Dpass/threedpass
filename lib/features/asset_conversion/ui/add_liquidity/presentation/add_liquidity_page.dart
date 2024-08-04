import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/safe_native_symbol.dart';
import 'package:threedpass/core/utils/validators.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/other/full_row_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/asset_conversion/ui/add_liquidity/bloc/add_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/widgets/slippage_tolerance.dart';
import 'package:threedpass/features/other/choose_account/presentation/choose_account.dart';
import 'package:threedpass/features/other/some_form/some_form.dart';
import 'package:threedpass/features/other/some_form/some_form_submit_button.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class AddLiquidityPage extends StatelessWidget {
  const AddLiquidityPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<AddLiquidityCubit>(context);
    final poscanAssetsCubit = BlocProvider.of<PoscanAssetsCubit>(context);
    final metadata = poscanAssetsCubit.state.metadata;
    final appServiceLoaderCubit =
        BlocProvider.of<AppServiceLoaderCubit>(context);
    final nativeSymbols =
        appServiceLoaderCubit.state.networkStateData.safeNativeSymbol;

    final asset1Symbols = (cubit.asset1.isNative
            ? nativeSymbols
            : metadata[cubit.asset1.assetId]?.symbol) ??
        '???';
    final asset2Symbols = (cubit.asset2.isNative
            ? nativeSymbols
            : metadata[cubit.asset2.assetId]?.symbol) ??
        '???';

    final double asset1UserBalance = cubit.asset1.isNative
        ? appServiceLoaderCubit.fastAvailableBalance
        : poscanAssetsCubit.fastBalanceById(cubit.asset1.assetId!).toDouble();
    final double asset2UserBalance = cubit.asset2.isNative
        ? appServiceLoaderCubit.fastAvailableBalance
        : poscanAssetsCubit.fastBalanceById(cubit.asset2.assetId!).toDouble();

    return SomeForm(
      formKey: cubit.formKey,
      appbarTitle: 'add_liquidity_page_title',
      submitButton: SomeFormSubmitButton(
        formState: cubit,
      ),
      children: [
        Text(
          '$asset1Symbols / $asset2Symbols',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        ChooseAccount(
          title: 'add_liquidity_page_choose_account_title',
          passwordController: cubit.passwordController,
          onAccountSelected: null,
        ),
        D3pTextFormField(
          labelText: 'add_liquidity_page_amount_desired_pattern'
              .tr(args: [asset1Symbols]),
          controller: cubit.amount1DesiredController,
          keyboardType: TextInputType.number,
          validator: (final p0) =>
              Validators.onlyFloatMax(p0, asset1UserBalance),
          onChanged: (final p0) => cubit.onFirstDesiredChanged(),
        ),

        D3pTextFormField(
          labelText: 'add_liquidity_page_amount_desired_pattern'
              .tr(args: [asset2Symbols]),
          controller: cubit.amount2DesiredController,
          keyboardType: TextInputType.number,
          validator: (final p0) =>
              Validators.onlyFloatMax(p0, asset2UserBalance),
          onChanged: (final p0) => cubit.onSecondDesiredChanged(),
        ),

        SlippageTolerance(
          controller: cubit.slippageController,
          hintText: '${AddLiquidityCubit.defaultSlippage}%',
          onChanged: (final p0) => cubit.setSlippageTolerance(),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<AddLiquidityCubit, AddLiquidityState>(
              buildWhen: (final previous, final current) =>
                  previous.asset1Min != current.asset1Min,
              builder: (final context, final state) => SizedBox(
                height: 16,
                child: state.asset1Min != null
                    ? FullRowText(
                        leftText: 'add_liquidity_calculated_min'.tr(
                          args: [
                            asset1Symbols,
                          ],
                        ),
                        translateLeft: false,
                        rightText: state.asset1Min!,
                      )
                    : const SizedBox(),
              ),
            ),
            const H8(),
            BlocBuilder<AddLiquidityCubit, AddLiquidityState>(
              buildWhen: (final previous, final current) =>
                  previous.asset2Min != current.asset2Min,
              builder: (final context, final state) => SizedBox(
                height: 16,
                child: state.asset2Min != null
                    ? FullRowText(
                        leftText: 'add_liquidity_calculated_min'.tr(
                          args: [
                            asset2Symbols,
                          ],
                        ),
                        translateLeft: false,
                        rightText: state.asset2Min!,
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
        // D3pTextFormField(
        //   labelText: 'add_liquidity_page_amount_1_min_label'.tr(),
        //   controller: cubit.amount1Min,
        //   keyboardType: TextInputType.number,
        //   validator: Validators.onlyFloat,
        // ),
        // D3pTextFormField(
        //   labelText: 'add_liquidity_page_amount_2_min_label'.tr(),
        //   controller: cubit.amount2Min,
        //   keyboardType: TextInputType.number,
        //   validator: Validators.onlyFloat,
        // ),
      ],
    );
  }
}
