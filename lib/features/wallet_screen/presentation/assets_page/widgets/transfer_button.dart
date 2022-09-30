import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/router/router.gr.dart';

class TransferButton extends StatelessWidget {
  const TransferButton({Key? key}) : super(key: key);

  void onPressed(BuildContext context) {
    context.router.push(
      const TransferWrapperRoute(
          // appService: BlocProvider.of<AppServiceLoaderCubit>(context).state,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) => ValueListenableBuilder(
        valueListenable: state.balance,
        builder: (context, BalanceData balance, child) {
          return D3pElevatedButton(
            text: 'transfer_coins_button_label'.tr(),
            onPressed: balance.isNull ? null : () => onPressed(context),
          );
        },
      ),
    );
  }
}
