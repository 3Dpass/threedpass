import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/balance_card/avaliable_balance_card.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/balance_card/locked_balance_card.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/balance_card/reserved_balance_card.dart';

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
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;

    if (appService.networkStateData.isNull) {
      return placeHolder;
    }

    final String tokenSymbol = appService.networkStateData.tokenSymbol!.first;
    final int tokenDecimals = appService.networkStateData.tokenDecimals!.first;

    return ValueListenableBuilder(
      valueListenable: appService.balance,
      builder: (context, BalanceData balance, child) {
        if (balance.isNull) {
          return placeHolder;
        }
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: BalanceUtils.formattedTotal(
                  balance,
                  tokenDecimals,
                ),
                children: [
                  TextSpan(
                    text: tokenSymbol,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AvaliableBalanceCard(
                  balance: balance.availableBalance,
                  tokenSymbol: tokenSymbol,
                  tokenDecimals: tokenDecimals,
                ),
                LockedBalanceCard(
                  balance: balance.lockedBalance,
                  tokenSymbol: tokenSymbol,
                  tokenDecimals: tokenDecimals,
                ),
                ReservedBalanceCard(
                  balance: balance.reservedBalance,
                  tokenSymbol: tokenSymbol,
                  tokenDecimals: tokenDecimals,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
