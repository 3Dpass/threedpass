import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/features/other/card_with_buttons/fast_card_button.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/widgets/is_account_ready_builder.dart';
import 'package:threedpass/router/router.gr.dart';

class CoinTransferButton extends StatelessWidget {
  const CoinTransferButton({final Key? key}) : super(key: key);

  Future<void> onPressed(final BuildContext context) async {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;

    await context.router.push(
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
        return FastCardButton(
          title: 'transfer_coins_button_label',
          iconData: Icons.arrow_upward_rounded,
          isLoading: !isReady,
          onButtonPressed: isReady ? () => onPressed(context) : null,
        );
      },
    );
  }
}
