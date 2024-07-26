import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/layout/list_view_separated.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanAssetMetadataWidget extends StatelessWidget {
  const PoscanAssetMetadataWidget({
    required this.metadata,
    required this.poscanAssetData,
    super.key,
  });

  final PoscanAssetMetadata? metadata;
  final PoscanAssetData poscanAssetData;

  @override
  Widget build(final BuildContext context) {
    if (metadata == null) {
      final account = BlocProvider.of<AppServiceLoaderCubit>(context)
          .state
          .keyring
          .current; // TODO Change this for read-only mode
      if (poscanAssetData.owner == account.address) {
        // TODO Check if admin or owner sets the metadata
        return _NoMetadataCanSet(
          poscanAssetData: poscanAssetData,
        );
      } else {
        return const _NoMetadataCantSet();
      }
    } else {
      return _HasMetadata(
        metadata: metadata!,
        poscanAssetData: poscanAssetData,
      );
    }
  }
}

class _GoToSetMetadata extends StatelessWidget {
  const _GoToSetMetadata({
    required this.poscanAssetData,
  });

  final PoscanAssetData poscanAssetData;

  void onPressed(final BuildContext context) {
    context.router.push(
      SetMetadataRouteWrapper(initialAssetId: poscanAssetData.id),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      text: 'poscan_asset_page_metadata_button_label'.tr(),
      onPressed: () => onPressed(context),
    );
  }
}

class _HasMetadata extends StatelessWidget {
  const _HasMetadata({
    required this.metadata,
    required this.poscanAssetData,
  });

  final PoscanAssetMetadata metadata;
  final PoscanAssetData poscanAssetData;

  @override
  Widget build(final BuildContext context) {
    final children = <Widget>[
      FastRichText(
        mainText: metadata.name,
        secondaryText: 'poscan_asset_page_name_secondary'.tr(),
        needSpace: true,
      ),
      FastRichText(
        mainText: metadata.symbol,
        secondaryText: 'poscan_asset_page_symbol_secondary'.tr(),
        needSpace: true,
      ),
      FastRichText(
        mainText: metadata.decimals,
        secondaryText: 'poscan_asset_page_decimals_secondary'.tr(),
        needSpace: true,
      ),
    ];

    final account = BlocProvider.of<AppServiceLoaderCubit>(context)
        .state
        .keyring
        .current; // TODO Change this for read-only mode
    if (poscanAssetData.owner == account.address) {
      // TODO Check if admin or owner sets the metadata
      children.add(_GoToSetMetadata(poscanAssetData: poscanAssetData));
    }
    return ListViewSeparated(children: children);
  }
}

class _NoMetadataCanSet extends StatelessWidget {
  const _NoMetadataCanSet({
    required this.poscanAssetData,
  });

  final PoscanAssetData poscanAssetData;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const D3pBodyMediumText('poscan_asset_page_metadata_help'),
        const SizedBoxH8(),
        _GoToSetMetadata(
          poscanAssetData: poscanAssetData,
        ),
      ],
    );
  }
}

class _NoMetadataCantSet extends StatelessWidget {
  const _NoMetadataCantSet();
  @override
  Widget build(final BuildContext context) {
    return const D3pBodyMediumText('No metadata set for this asset');
  }
}
