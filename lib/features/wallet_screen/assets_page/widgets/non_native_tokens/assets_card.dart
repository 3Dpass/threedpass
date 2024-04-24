import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';

class AssetsCard extends StatelessWidget {
  const AssetsCard(this.data, {super.key});

  final PoscanAssetCombined data;

  void onCardClick(final BuildContext context) {
    // final address = BlocProvider.of<AppServiceLoaderCubit>(context)
    //     .state
    //     .keyring
    //     .current
    //     .address!;
    // TODO Push to token page
    // context.router.push(
    //   NonNativeTokenRouteWrapper(
    //     params: GetExtrinsicsUseCaseParams(
    //       address: address,
    //       tokenBalanceData: data,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(final BuildContext context) {
    return ClickableCard(
      onTap: () => onCardClick(context),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // METADATA OR NO METADATA
          D3pBodyMediumText(
            'METADATA', // data.tokenData.fullName ?? '',
            translate: false,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              D3pBodyMediumText(
                '10.0',
                // data.balance.toString(),
                translate: false,
              ),
              const SizedBox(width: 8),
              D3pBodyMediumText(
                'TUI', // data.tokenData.symbols ?? '',
                translate: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
