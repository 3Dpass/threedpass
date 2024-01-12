import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/widgets/is_account_ready_builder.dart';
import 'package:threedpass/router/router.gr.dart';

class CoinTransferButton extends StatelessWidget {
  const CoinTransferButton({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;

    context.router.push(
      TransferRouteWrapper(
        metadata: CoinsTransferMetaDTO(
          name: appService.networkStateData.tokenSymbol?.first ?? '',
          decimals: appService.networkStateData.safeDecimals,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return IsAccountReadyBuilder(
      builder: (final BuildContext context, final bool isReady) {
        return D3pElevatedButton(
          text: 'transfer_coins_button_label'.tr(),
          iconData: Icons.arrow_upward_rounded,
          onPressed: isReady ? () => onPressed(context) : null,
        );
      },
    );
  }
}
