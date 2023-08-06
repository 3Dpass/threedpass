import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';

class IsAccountReadyBuilder extends StatelessWidget {
  const IsAccountReadyBuilder({
    required this.builder,
    final Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, bool isReady) builder;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (final context, final state) => ValueListenableBuilder(
        valueListenable: state.chosenAccountBalance,
        builder: (final context, final BalanceData balance, final child) {
          return builder(context, !balance.isNull);
        },
      ),
    );
  }
}
