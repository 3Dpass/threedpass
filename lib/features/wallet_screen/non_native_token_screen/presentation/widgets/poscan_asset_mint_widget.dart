import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/layout/list_view_separated.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanAssetMintWidget extends StatelessWidget {
  final PoscanAssetData poscanAssetData;

  const PoscanAssetMintWidget({
    required this.poscanAssetData,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final children = <Widget>[
      FastRichText(
        mainText: poscanAssetData.supply,
        secondaryText: 'poscan_asset_page_supply_secondary'.tr(),
        needSpace: true,
      ),
    ];

    final account = BlocProvider.of<AppServiceLoaderCubit>(context)
        .state
        .keyring
        .current; // TODO Change this for read-only mode

    if (poscanAssetData.issuer == account.address) {
      children.add(
        D3pElevatedButton(
          text: 'mint_asset_button_label'.tr(),
          onPressed: () => context.router.push(
            MintAssetRouteWrapper(initialAssetId: poscanAssetData.id),
          ),
        ),
      );
    }

    return ListViewSeparated(children: children);
  }
}
