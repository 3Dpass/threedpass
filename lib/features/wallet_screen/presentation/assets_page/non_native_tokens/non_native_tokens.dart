import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

part './non_native_tokens_loading.dart';
part './non_native_tokens_placeholder.dart';
part './non_native_tokens_column.dart';
part './non_native_tokens_card.dart';

class NonNativeTokens extends StatelessWidget {
  const NonNativeTokens();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) {
        if (state.networkStateData.isNull) {
          return const _NonNativeTokensLoading();
        }

        final String tokenSymbol = state.networkStateData.tokenSymbol!.first;
        final int tokenDecimals = state.networkStateData.safeDecimals;

        print(tokenSymbol);
        print(tokenDecimals);

        bool allTokensEmpty = true;
        final tokensData = state.plugin.balances.tokens;
        for (var token in tokensData) {
          if (token.amount != null &&
              int.tryParse(token.amount!) != null &&
              int.parse(token.amount!) > 0) {
            allTokensEmpty = false;
          }
        }
        print(allTokensEmpty);
        if (allTokensEmpty) {
          return const _NonNativeTokensPlaceholder();
        } else {
          return _NonNativeTokensColumn(tokensData);
        }
      },
    );
  }
}
