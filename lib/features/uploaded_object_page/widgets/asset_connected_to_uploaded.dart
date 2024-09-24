import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/router/router.gr.dart';

class AssetsConnectedToUploaded extends StatelessWidget {
  final Iterable<PoscanAssetData> assets;

  const AssetsConnectedToUploaded({required this.assets, super.key});

  String foldAssetInfo(
    final PoscanAssetData data,
    final PoscanAssetMetadata? metadata,
  ) {
    if (metadata == null) {
      return 'id: ${data.id}';
    } else {
      return '${metadata.name}';
    }
  }

  Future<void> onCardClick(
    final BuildContext context,
    final PoscanAssetData data,
  ) async {
    final state = BlocProvider.of<PoscanAssetsCubit>(context).state;
    final combined =
        state.combined.firstWhere((final e) => e.poscanAssetData.id == data.id);
    final address = BlocProvider.of<AppServiceLoaderCubit>(context)
        .state
        .keyring
        .current
        .address!;
    await context.router.push(
      NonNativeTokenRouteWrapper(
        params: GetExtrinsicsUseCaseParams(
          address: address,
          poscanAssetCombined: combined,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    // if (state.)
    final state = BlocProvider.of<PoscanAssetsCubit>(context).state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: assets.map<Widget>((final data) {
        final metadata = state.metadata[data.id];
        final text = foldAssetInfo(data, metadata);
        return D3pTextButton(
          text: 'View asset $text',
          onPressed: () async => onCardClick(context, data),
        );
      }).toList(),
    );
  }
}
