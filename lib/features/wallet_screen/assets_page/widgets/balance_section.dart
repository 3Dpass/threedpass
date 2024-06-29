import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/actual_balance.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/buttons_panel.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  static final placeHolder = Center(
    child: PlatformCircularProgressIndicator(),
  );

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: BalanceCard.height + 8 + AssetPageButtonsPanel.height,
      child: BlocBuilder<AppServiceLoaderCubit, AppService>(
        builder: (final context, final state) {
          if (state.networkStateData.isNull) {
            return placeHolder;
          }

          final String tokenSymbol = state.networkStateData.tokenSymbol!.first;
          final int tokenDecimals = state.networkStateData.safeDecimals;

          return ValueListenableBuilder(
            valueListenable: state.chosenAccountBalance,
            builder: (final context, final BalanceData balance, final child) {
              if (balance.isNull) {
                return placeHolder;
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BalanceCard(
                    balance: balance,
                    tokenDecimals: tokenDecimals,
                    tokenSymbol: tokenSymbol,
                  ),
                  const SizedBoxH8(),
                  const AssetPageButtonsPanel(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
