import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/actual_balance.dart';

class AssetsCount extends StatelessWidget {
  const AssetsCount({Key? key}) : super(key: key);

  static final placeHolder = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      PlatformCircularProgressIndicator(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) {
        if (state.networkStateData.isNull) {
          return placeHolder;
        }

        final String tokenSymbol = state.networkStateData.tokenSymbol!.first;
        final int tokenDecimals = state.networkStateData.safeDecimals;

        return ValueListenableBuilder(
          valueListenable: state.balance,
          builder: (context, BalanceData balance, child) {
            if (balance.isNull) {
              return placeHolder;
            }

            return ActualBalance(
              balance: balance,
              tokenDecimals: tokenDecimals,
              tokenSymbol: tokenSymbol,
            );
          },
        );
      },
    );
  }
}
