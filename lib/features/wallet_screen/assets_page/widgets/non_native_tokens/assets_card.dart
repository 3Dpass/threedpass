import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/asset_card_body.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/non_native_tokens/asset_card_no_metadata.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/router/router.gr.dart';

class AssetsCard extends StatelessWidget {
  const AssetsCard(this.data, {super.key});

  final PoscanAssetCombined data;

  Future<void> onCardClick(final BuildContext context) async {
    final address = BlocProvider.of<AppServiceLoaderCubit>(context)
        .state
        .keyring
        .current
        .address!;
    await context.router.push(
      NonNativeTokenRouteWrapper(
        params: GetExtrinsicsUseCaseParams(
          address: address,
          poscanAssetCombined: data,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return ClickableCard(
      onTap: () async => onCardClick(context),
      child: data.poscanAssetMetadata != null
          ? AssetCardBody(
              metadata: data.poscanAssetMetadata!,
              balance: data.poscanAssetBalance,
            )
          : AssetCardNoMetadata(
              poscanAssetData: data.poscanAssetData,
            ),
    );
  }
}
