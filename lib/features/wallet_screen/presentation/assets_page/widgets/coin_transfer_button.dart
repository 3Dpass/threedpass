import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/is_account_ready_builder.dart';
import 'package:threedpass/router/router.gr.dart';

class CoinTransferButton extends StatelessWidget {
  const CoinTransferButton({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;

    context.router.push(
      TransferRouteWrapper(
        metadata: CoinsTransferMetaDTO(
          coinName: appService.networkStateData.tokenSymbol?.first ?? '',
          appService: appService,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final style = Theme.of(context).customTextStyles.d3pFloatingButton;

    return IsAccountReadyBuilder(
      builder: (final BuildContext context, final bool isReady) {
        return FloatingActionButton.extended(
          icon: const Icon(Icons.arrow_upward_rounded),
          label: Text(
            'transfer_coins_button_label'.tr(),
            style: style,
          ),
          onPressed: isReady ? () => onPressed(context) : null,
        );
      },
    );
  }
}
