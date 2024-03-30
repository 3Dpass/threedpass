import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/poscan_token_data.dart';

class AssetsCard extends StatelessWidget {
  const AssetsCard(this.data, {super.key});

  final PoscanTokenData data;

  void onCardClick(final BuildContext context) {
    final address = BlocProvider.of<AppServiceLoaderCubit>(context)
        .state
        .keyring
        .current
        .address!;
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
    return D3pCard(
      child: InkWell(
        onTap: () => onCardClick(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: D3pBodyMediumText(
                  data.fullName ?? '',
                  translate: false,
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    D3pBodyMediumText(
                      data.amount.toString(),
                      translate: false,
                    ),
                    const SizedBox(width: 8),
                    D3pBodyMediumText(
                      data.symbol ?? '',
                      translate: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
