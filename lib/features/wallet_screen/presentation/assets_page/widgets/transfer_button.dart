import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/is_account_ready_builder.dart';
import 'package:threedpass/router/router.gr.dart';

class TransferButton extends StatelessWidget {
  const TransferButton({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    context.router.push(
      const TransferWrapperRoute(
          // appService: BlocProvider.of<AppServiceLoaderCubit>(context).state,
          ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return IsAccountReadyBuilder(
      builder: (final BuildContext context, final bool isReady) {
        return D3pElevatedButton(
          text: 'transfer_coins_button_label'.tr(),
          onPressed: isReady ? () => onPressed(context) : null,
        );
      },
    );
  }
}
