import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/polkawallet/utils/token_balance_data_amount_check.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/assets_column.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/assets_loading.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/assets_loading_placeholder.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/assets_placeholder.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/poscan_token_data.dart';

class NonNativeTokens extends StatelessWidget {
  const NonNativeTokens({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.appSettings.showZeroAssets !=
          current.appSettings.showZeroAssets,
      builder: (final context, final settings) {
        return BlocBuilder<AppServiceLoaderCubit, AppService>(
          builder: (final context, final appService) {
            if (appService.networkStateData.isNull) {
              return const AssetsLoading();
            }

            // This builder checks if new account just immported and hides the assets
            // until balance loads
            return ValueListenableBuilder(
              valueListenable: appService.chosenAccountBalance,
              builder: (final context, final BalanceData balance, final child) {
                if (balance.isNull) {
                  return const SizedBox();
                }

                /// Subscribe to balance to update widget after transfer
                return ValueListenableBuilder(
                  valueListenable: appService.tokensAreLoading,
                  builder: (final context, final bool isLoading, final child) {
                    if (isLoading) {
                      return const AssetsLoadingPlaceholder();
                    }

                    bool allTokensEmpty = true;
                    final tokensData = appService.plugin.balances.tokens;
                    for (final token in tokensData) {
                      if (token.isAmountPositive) {
                        allTokensEmpty = false;
                      }
                    }

                    final settings =
                        BlocProvider.of<SettingsConfigCubit>(context).state;
                    final showZeroAssets = settings.appSettings.showZeroAssets;

                    if (allTokensEmpty && !showZeroAssets) {
                      return const AssetsPlaceholder();
                    } else {
                      return PoscanAssetsColumn(
                        [
                          PoscanTokenData(
                            amount: 10.2,
                            symbol: 'USD',
                            fullName: 'Dollar',
                          )
                        ],
                      );
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
