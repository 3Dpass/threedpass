import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/other/link_to_page/entities/link_to_page_params.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/router/router.gr.dart';

class LinkToPoscanAssetPageParams extends LinkToPageParams {
  LinkToPoscanAssetPageParams({
    required final PoscanAssetData asset,
    required final BuildContext context,
  }) : super(
          title: 'asset_link_text'.tr(args: [asset.foldAssetInfo()]),
          onPressed: () async => pushToPoscanAssetPage(context, asset),
        );

  static Future<void> pushToPoscanAssetPage(
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
}
