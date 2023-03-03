import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/wallet_screen/bloc/transfer_info_cubit.dart';

class TransferPageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const TransferPageWrapper({
    final Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final balance = BalanceUtils.bigIntToDouble(
      BalanceUtils.balanceInt(
        appService.balance.value.availableBalance as String?,
      ),
      appService.networkStateData.safeDecimals,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<TransferInfoCubit>(
          // We are not calculating fees now
          create: (final _) => TransferInfoCubit(balance)..init(appService),
          lazy: false,
        ),
        BlocProvider(
          create: (final _) => OuterContextCubit(context),
          lazy: false,
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return const AutoRouter();
  }
}
