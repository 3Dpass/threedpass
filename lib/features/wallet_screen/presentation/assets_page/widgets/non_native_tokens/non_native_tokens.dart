import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/polkawallet/utils/token_balance_data_amount_check.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';

part './non_native_tokens_loading.dart';
part './non_native_tokens_placeholder.dart';
part './non_native_tokens_column.dart';
part './non_native_tokens_card.dart';

class NonNativeTokens extends StatelessWidget {
  const NonNativeTokens({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (previous, current) =>
          previous.appSettings.showZeroAssets !=
          current.appSettings.showZeroAssets,
      builder: (final context, final settings) {
        return BlocBuilder<AppServiceLoaderCubit, AppService>(
          builder: (final context, final appService) {
            if (appService.networkStateData.isNull) {
              return const _NonNativeTokensLoading();
            }

            bool allTokensEmpty = true;
            final tokensData = appService.plugin.balances.tokens;
            for (final token in tokensData) {
              if (token.amountIsPositive) {
                allTokensEmpty = false;
              }
            }

            final settings =
                BlocProvider.of<SettingsConfigCubit>(context).state;
            final showZeroAssets = settings.appSettings.showZeroAssets!;
            print('a');
            print(allTokensEmpty);
            print(showZeroAssets);

            if (allTokensEmpty && !showZeroAssets) {
              return const _NonNativeTokensPlaceholder();
            } else {
              return _NonNativeTokensColumn(tokensData);
            }
          },
        );
      },
    );
  }
}
