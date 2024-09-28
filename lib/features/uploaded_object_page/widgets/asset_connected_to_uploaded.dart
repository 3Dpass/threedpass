import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/uploaded_object_page/widgets/basic_links_list.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/router/router.gr.dart';

class AssetsConnectedToUploaded extends StatelessWidget {
  final Iterable<PoscanAssetData> assets;

  const AssetsConnectedToUploaded({required this.assets, super.key});

  Future<void> onPressed(
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
    return BasicLinksList(
      items: assets.map<LinkParams>((final data) {
        return LinkParams(
          title: 'asset_link_text'.tr(args: [data.foldAssetInfo(context)]),
          onPressed: () async => onPressed(context, data),
        );
      }).toList(),
    );
  }
}
